require 'spec_helper'

describe 'repeat_get_related_objects' do

  context 'with large number of related objects files' do
    # let(:test_counts) { {   10 => Hydra::PCDM::Collection.create } }
    let(:test_counts) { {   10 => Hydra::PCDM::Collection.create,
                            50 => Hydra::PCDM::Collection.create,
                           100 => Hydra::PCDM::Collection.create
                          # 1000 => Hydra::PCDM::GenericWork.create
                        } }
    before do
      puts( "============================================" )
      puts( " Creating and appending related objects" )
      puts( "============================================" )
      puts( "r_obj count   time (s)   time/r_obj")
      puts( "-----------   --------   ----------")
      format = "%8d      %8.3f   %7.3f\n"

      test_counts.each_pair do |related_object_count,collection|
        st = Time.now.to_f
        related_object_count.times do
          Hydra::PCDM::AddRelatedObjectToCollection.call( collection, Hydra::PCDM::Object.create )
        end
        t = Time.now.to_f - st
        printf( format,10,t,t/related_object_count )
      end
    end

    describe 'time for each get approach for various counts of related objects in a collection' do
      xit 'should perform consistently across each approach' do
        format = "%-20s   %11.8f   %14.12f\n"
        printf("\n\n")

        test_counts.each_pair do |related_object_count,collection|
          puts
          puts( "============================================" )
          puts( " Getting #{related_object_count} related objects 1 time" )
          puts( "============================================" )
          puts( "    get approach         time (s)    time/r_obj (s)")
          puts( "--------------------   -----------   --------------")

          st = Time.now.to_f
          collection.related_objects
          t = Time.now.to_f - st
          printf( format,".related_objects",t,t/related_object_count )

          st = Time.now.to_f
          collection.related_objects.to_a
          t = Time.now.to_f - st
          printf( format,".related_object.to_a",t,t/related_object_count )

          st = Time.now.to_f
          Hydra::PCDM::GetRelatedObjectsFromCollection.call( collection )
          t = Time.now.to_f - st
          printf( format,"service call",t,t/related_object_count )
        end
      end
    end
  end

  context 'with large number of gets' do
    describe 'time for repeatedly getting related objects from the same collection' do
      let(:related_object_count) { 10 }
      let(:collection)   { Hydra::PCDM::Collection.create }
      # let(:repeat_counts)    { [10,50,100,1000] }
      let(:repeat_counts)    { [10,50,100] }
      # let(:repeat_counts)    { [10] }

      before do
        related_object_count.times do
          Hydra::PCDM::AddRelatedObjectToCollection.call( collection, Hydra::PCDM::Object.create )
        end
      end

      xit 'should perform consistently across each get approach' do
        format = "%-20s   %11.8f   %14.12f\n"
        printf("\n\n")

        repeat_counts.each do |repeat_count|
          puts
          puts( "============================================" )
          puts( " Getting #{related_object_count} related_objects #{repeat_count} times" )
          puts( "============================================" )
          puts( "    get approach         time (s)    time/get (s)")
          puts( "--------------------   -----------   ------------")

          st = Time.now.to_f
          repeat_count.times do
            collection.related_objects
          end
          t = Time.now.to_f - st
          printf( format,".related_objects",t,t/repeat_count )

          st = Time.now.to_f
          repeat_count.times do
            collection.related_objects.to_a
          end
          t = Time.now.to_f - st
          printf( format,".related_object.to_a",t,t/repeat_count )

          st = Time.now.to_f
          repeat_count.times do
            Hydra::PCDM::GetRelatedObjectsFromCollection.call( collection )
          end
          t = Time.now.to_f - st
          printf( format,"service call",t,t/repeat_count )
        end
      end
    end
  end
end
