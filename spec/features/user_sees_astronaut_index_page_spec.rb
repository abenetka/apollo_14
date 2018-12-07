require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the astronaut index page' do
    it 'displays all astronauts'do
    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Wanda Astronaut", age: 35, job: "Support Professional")
    astronaut_3 = Astronaut.create(name: "Astronaut Bob", age: 30, job: "Master Astronaut")

    visit '/astronauts'

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
    expect(page).to have_content(astronaut_3.name)
    expect(page).to have_content(astronaut_3.age)
    expect(page).to have_content(astronaut_3.job)

    end

    it 'shows statistics about astronauts'do
    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Wanda Astronaut", age: 35, job: "Support Professional")
    astronaut_3 = Astronaut.create(name: "Astronaut Bob", age: 30, job: "Master Astronaut")

    visit '/astronauts'

    expect(page).to have_content(Astronaut.average_age)
    end

    it 'shows space missions' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Wanda Astronaut", age: 35, job: "Support Professional")
      astronaut_3 = Astronaut.create(name: "Astronaut Bob", age: 30, job: "Master Astronaut")
      mission_1 = astronaut_1.missions.create(title: "Apollo 13", time_in_space: 70)
      mission_2 = astronaut_1.missions.create(title: "Aquarius 7", time_in_space: 200)
      mission_3 = astronaut_2.missions.create(title: "Apollo 13", time_in_space: 70)
      mission_4 = astronaut_2.missions.create(title: "Aquarius 7", time_in_space: 200)
      mission_5 = astronaut_3.missions.create(title: "Apollo 13", time_in_space: 70)

    visit '/astronauts'

    expect(page).to have_content(mission_1.title)
    expect(page).to have_content(mission_2.title)
    expect(page).to have_content(mission_3.title)
    expect(page).to have_content(mission_4.title)
    expect(page).to have_content(mission_5.title)
    end

    it 'shows total time in space' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Wanda Astronaut", age: 35, job: "Support Professional")
      astronaut_3 = Astronaut.create(name: "Astronaut Bob", age: 30, job: "Master Astronaut")
      mission_1 = astronaut_1.missions.create(title: "Apollo 13", time_in_space: 70)
      mission_2 = astronaut_1.missions.create(title: "Aquarius 7", time_in_space: 200)
      mission_3 = astronaut_2.missions.create(title: "Apollo 13", time_in_space: 70)
      mission_4 = astronaut_2.missions.create(title: "Aquarius 7", time_in_space: 200)
      mission_5 = astronaut_3.missions.create(title: "Apollo 13", time_in_space: 70)

      visit '/astronauts'

      expect(page).to have_content("Total time in space: #{astronaut_1.total_time_in_space}")
    end

  end
end
