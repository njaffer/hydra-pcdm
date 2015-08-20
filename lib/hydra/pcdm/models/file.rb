module Hydra::PCDM
  class File < ActiveFedora::File
    include ActiveFedora::WithMetadata

    metadata do
      configure type: Vocab::PCDMTerms.File
      property :label, predicate: ::RDF::RDFS.label

      property :file_name, predicate: RDF::Vocab::EBUCore.filename
      property :file_size, predicate: RDF::Vocab::EBUCore.fileSize
      property :date_created, predicate: RDF::Vocab::EBUCore.dateCreated
      property :has_mime_type, predicate: RDF::Vocab::EBUCore.hasMimeType
      property :date_modified, predicate: RDF::Vocab::EBUCore.dateModified
      property :byte_order, predicate: Vocab::SweetJPLTerms.byteOrder

      # This is a server-managed predicate which means Fedora does not let us change it.
      property :file_hash, predicate: RDF::Vocab::PREMIS.hasMessageDigest
    end
  end
end
