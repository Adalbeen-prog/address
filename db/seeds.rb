# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all
Location.destroy_all

def sex(birthNumber)
    return birthNumber[2,2].to_i > 50 ? 'Žena' : 'Muž'
end

def year(birthNumber)
    birthMonth = birthNumber[2,2].to_i > 50 ? birthNumber[2,2].to_i-50 : birthNumber[2,2].to_i
    birthMonth = birthMonth.to_s.length == 2 ? birthMonth : "0"+birthMonth.to_s
    if birthNumber[0,2].to_i < 54 && birthNumber.length != 10
        birthYear = "20"+birthNumber[0,2]
    else
        birthYear = "19"+birthNumber[0,2]
    end
    return "#{birthNumber[4,2].to_s}/#{birthMonth}/#{birthYear}"
end

def generateBirthNumber
    yearNumber = rand(00..99)
    year = yearNumber.to_s.length == 2 ? yearNumber : "0"+yearNumber.to_s
    monthNumber = rand(2) == 0 ? rand(00..12) : rand(51...62)
    month = monthNumber.to_s.length == 2 ? monthNumber : "0"+monthNumber.to_s
    dayNumber = rand(00...31)
    day = dayNumber.to_s.length == 2 ? dayNumber : "0"+dayNumber.to_s
    return "#{year}#{month}#{day}/#{rand(100..9999)}"
end

50.times do
    birthNumber = generateBirthNumber
    pohlavi = sex(birthNumber)
    rokNarozeni = year(birthNumber)  
    champion = Faker::Games::LeagueOfLegends
    person = Person.create!([{
                name: champion.champion,
                surname: champion.summoner_spell,
                birthNumber: birthNumber,
                phoneNumber: rand(100000000..999999999),
                sex: pohlavi,
                dateOfBirth: rokNarozeni
            }     
        ])
    Location.create!([{
        city: champion.location,
        street: champion.quote[0..40],
        psc: rand(10000..99999),
        person_id: person[0][:id]
    }     
    ])
end




