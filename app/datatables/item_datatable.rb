class ItemDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Item.id" },
       name: { source: "Item.name"},
       description: { source: "Item.description"},
       price: { source: "Item.price"}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        description: record.description,
        price: record.price
      }
    end
  end

  private

  def get_raw_records
    Item.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
