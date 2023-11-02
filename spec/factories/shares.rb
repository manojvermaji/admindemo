FactoryBot.define do
  factory :share do
    description { "MyText" }
    image { "a.jpg" }
    video { "b.mp4" }
    audio_data { "c.mp3" }
    document { "d.pdf" }
  end
end
