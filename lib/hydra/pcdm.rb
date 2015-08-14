require 'active_support'
require 'mime/types'
require 'active_fedora/aggregation'

module Hydra
  module PCDM
    extend ActiveSupport::Autoload

    module Vocab
      extend ActiveSupport::Autoload
      eager_autoload do
        autoload :PCDMTerms
        autoload :SweetJPLTerms
      end
    end

    # models
    autoload_under 'models' do
      autoload :Collection
      autoload :Object
      autoload :File
    end

    # behavior concerns
    autoload_under 'models/concerns' do
      autoload :CollectionBehavior
      autoload :ObjectBehavior
      autoload :PcdmBehavior
    end

    autoload :CollectionIndexer
    autoload :ObjectIndexer

    # file services
    autoload :AddTypeToFile,                     'hydra/pcdm/services/file/add_type'
    autoload :GetMimeTypeForFile,                'hydra/pcdm/services/file/get_mime_type'

    # Iterators
    autoload :DeepMemberIterator,                'hydra/pcdm/deep_member_iterator'

    # Associations
    autoload :AncestorChecker,                   'hydra/pcdm/ancestor_checker'
    autoload :Validators,                        'hydra/pcdm/validators'
  end
end
