class Heap < ApplicationRecord
     belongs_to :form, foreign_key: :form_id, primary_key: :id, required: true

     def accept(index: )
          if !(self.accepted_indices.split(",").map(&:to_i).include? index)
               self.accepted_indices = self.accepted_indices.split(",").map(&:to_i).push(index).join(",")
          end
          if (self.waitlisted_indices.split(",").map(&:to_i).include? index)
               temp = self.waitlisted_indices.split(",").map(&:to_i)
               temp.delete(index)
               self.waitlisted_indices = temp.join(",")
          end
          if (self.rejected_indices.split(",").map(&:to_i).include? index)
               temp = self.rejected_indices.split(",").map(&:to_i)
               temp.delete(index)
               self.rejected_indices = temp.join(",")
          end

          self.save
     end
     
     def waitlist(index: )
          if (self.accepted_indices.split(",").map(&:to_i).include? index)
               temp = self.accepted_indices.split(",").map(&:to_i)
               temp.delete(index)
               self.accepted_indices = temp.join(",")
          end

          if !(self.waitlisted_indices.split(",").map(&:to_i).include? index)
               self.waitlisted_indices = self.waitlisted_indices.split(",").map(&:to_i).push(index).join(",")
          end

          if (self.rejected_indices.split(",").map(&:to_i).include? index)
               temp = self.rejected_indices.split(",").map(&:to_i)
               temp.delete(index)
               self.rejected_indices = temp.join(",")
          end

          self.save
     end

     def reject(index: )
          if (self.accepted_indices.split(",").map(&:to_i).include? index)
               temp = self.accepted_indices.split(",").map(&:to_i)
               temp.delete(index)
               self.accepted_indices = temp.join(",")
          end

          if (self.waitlisted_indices.split(",").map(&:to_i).include? index)
               temp = self.waitlisted_indices.split(",").map(&:to_i)
               temp.delete(index)
               self.waitlisted_indices = temp.join(",")
          end

          if !(self.rejected_indices.split(",").map(&:to_i).include? index)
               self.rejected_indices = self.rejected_indices.split(",").map(&:to_i).push(index).join(",")
          end

          self.save
     end

end
