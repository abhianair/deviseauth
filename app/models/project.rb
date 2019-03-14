class Project < ApplicationRecord


def self.to_csv
	attributes = %w{id name title description}
	CSV.generate(headers: true) do |csv|
		csv << attributes

		all.each do |project|
			csv << project.attributes.values_at(*attributes)
		end
	end
end


end
