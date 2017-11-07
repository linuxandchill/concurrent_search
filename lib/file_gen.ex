defmodule FileGen do 
  def generate() do 
    file_list = []

    for _ <- 1..2 do 
      {:ok, file} = File.open("lib/dummy/" <> String.downcase(Faker.Name.first_name) 
              <> "-" <> String.downcase(Faker.Name.last_name) 
              <> "-" <> "#{:rand.uniform(10)}" <> ".txt", [:write])

      file_list = [file | file_list]

      Enum.each(file_list, fn(file) -> 
        IO.binwrite file, "#{:rand.uniform(10)} \n" 
        IO.binwrite file, "#{:rand.uniform(10)}"
        File.close file
      end)
    end
  end
end
