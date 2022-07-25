module RoomsHelper
    def check_price?
        true if @room.price.present?
    end

    def check_listing?
        true if @room.present?
    end

    def check_description?
        true if @room.listing_name.present? && @room.summary.present?
    end

    def check_location?
        true if @room.longitude.present? && @room.latitude.present?
    end

    def check_photo?
        true if @room.photos.any?
    end

    def answer_all?
        true if check_price? && check_listing? && check_description? && check_location? && check_photo?
    end
end
