require "acts_as_tree_rails3"
module FassetsPresentations
  class Frame < ActiveRecord::Base
    belongs_to :presentation
    acts_as_tree :order => :position
    #  alias :previous :higher_item 
    #  alias :next :lower_item
    #has_many :tray_positions, :dependent => :destroy

    serialize :content
    validates_presence_of :title, :template

    def slot(name)
      Slot.new(name, content[name]) if content && content[name]
    end
    def slots
      slot_names = []
      t = TemplateManager.inner_template(presentation.template, self.template)
      if t
        slots = t["slots"].inject([]) do |a, name|
          slot_names << name
          a << Slot.new(name, content && content[name])
        end
      end
      if content
        content.each do |k, v|
          slots << Slot.new(k, v, false) unless slot_names.include?(k)
        end
      end
      slots
    end
    #def path
    #  "/fassets_presentations/presentations/#{presentation.id}/frames/#{id}"
    #end
    def all_children
      all = []
      self.children.each do |frame|
        all << frame
        root_children = frame.all_children.flatten
        all << root_children unless root_children.empty?
      end
      return all.flatten
    end
  end
end

