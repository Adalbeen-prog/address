json.extract! person, :id, :name, :surname, :birthNumber, :phoneNumber, :sex, :dateOfBirth, :created_at, :updated_at
json.url person_url(person, format: :json)
