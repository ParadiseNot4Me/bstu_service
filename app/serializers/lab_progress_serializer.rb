class LabProgressSerializer < ActiveModel::Serializer
  attributes :id,:n, :mark

  def n
  	object.lab_work.n
  end
end
