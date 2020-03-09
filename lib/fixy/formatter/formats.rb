module Fixy
  module Formatter
    # Justifies an alpha to the left
    module Alphanumeric
      def format_alphanumeric(input, byte_width)
        input = input.to_s
        String.new(input).ljust(byte_width, " ")
      end
    end

    # Formats a number 93 to "00000093"
    module Numeric
      def format_numeric(input, byte_width)
        String.new(input.to_s).rjust(byte_width, "0")
      end
    end

    # Formats datetime to MMDDYYYYHHMMSS
    module DateTime
      def format_datetime(input, byte_width)
        input.strftime("%m%d%Y%H%M%S")
      end
    end

    # Formats date to MMDDYYYY
    module Date
      def format_date(input, byte_width)
        ::Date.strptime(input, "%d/%m/%Y").strftime("%m%d%Y")
      end
    end

    # Formats date to YYYY
    module YearDate
      def format_short_date(input, byte_width)
        ::Date.strptime(input, "%d/%m/%Y").strftime("%Y")
      end
    end

    # Formats floating point "9.34" to "000000934"
    module Amount
      def format_amount(input, byte_width)
         input = "%0.2f" % input
         input.gsub(".", "").rjust(byte_width, "0")
      end
    end
  end
end
