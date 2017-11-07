defmodule FileGen do 
  def generate(count) do 
    file_list = []

    for _ <- 1..count do 
      {:ok, file} = File.open("lib/dummy/" <> String.downcase(Faker.Name.first_name) 
              <> "-" <> String.downcase(Faker.Name.last_name) 
              <> "-" <> "#{:rand.uniform(10)}" <> ".txt", [:write])

      file_list = [file | file_list]

      Enum.each(file_list, fn(file) -> 
        for _ <- 1..200 do 
          IO.binwrite file, "#{:rand.uniform(100)} \n" 
        end
        File.close file
      end)
    end
  end
end

