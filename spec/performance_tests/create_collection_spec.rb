require 'spec_helper'

describe 'create a collection' do

  describe 'time for each approach' do
    it 'should perform consistently across each approach' do
      repetitions = 10
      results = [0,0]

      1.upto(repetitions) do |i|

        st = Time.now.to_f
        collection1 = Hydra::PCDM::Collection.new
        t = Time.now.to_f - st
        results[0] += t

        st = Time.now.to_f
        collection2 = Hydra::PCDM::Collection.create
        t = Time.now.to_f - st
        results[1] += t
      end

      format = "%-20s   %11.8f   %14.8f\n"
      printf("\n\n")

      puts
      puts( "============================================" )
      puts( " Create 1 collection (#{repetitions} repetitions)" )
      puts( "============================================" )
      puts( "    create approach       total time (s)   per object time (s)")
      puts( "--------------------   --------------   -------------------")

      printf( format,"new",  results[0], results[0]/repetitions )
      printf( format,"create",results[1], results[1]/repetitions )

    end
  end
end
