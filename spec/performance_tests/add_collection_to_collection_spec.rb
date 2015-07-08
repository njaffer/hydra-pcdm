require 'spec_helper'

describe 'add collection to collection' do

  describe 'time for each approach' do
    it 'should perform consistently across each approach' do
      repetitions = 10
      results = [0,0,0]

      1.upto(repetitions) do |i|
        parent_collection1 = Hydra::PCDM::Collection.create
        parent_collection2 = Hydra::PCDM::Collection.create
        parent_collection3 = Hydra::PCDM::Collection.create
        child_collection1 = Hydra::PCDM::Collection.create
        child_collection2 = Hydra::PCDM::Collection.create
        child_collection3 = Hydra::PCDM::Collection.create

        st = Time.now.to_f
        parent_collection1.members << child_collection1
        t = Time.now.to_f - st
        results[0] += t

        st = Time.now.to_f
        parent_collection2.child_collections = [child_collection2]
        t = Time.now.to_f - st
        results[1] += t

        st = Time.now.to_f
        Hydra::PCDM::AddCollectionToCollection.call( parent_collection3, child_collection3 )
        t = Time.now.to_f - st
        results[2] += t
      end

      format = "%-20s   %11.8f   %14.8f\n"
      printf("\n\n")

      puts
      puts( "============================================" )
      puts( " Adding one collection to a collection (#{repetitions} repetitions)" )
      puts( "============================================" )
      puts( "    add approach       total time (s)   per object time (s)")
      puts( "--------------------   --------------   -------------------")

      printf( format,"members <<",  results[0], results[0]/repetitions )
      printf( format,"collections=",results[1], results[1]/repetitions )
      printf( format,"service call",results[2], results[2]/repetitions )

    end
  end
end
