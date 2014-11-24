module Prep

  module People

    class Index < Jekyll::PrepScript

      def prepare(page)
        page.data['prepared'] = true
      end
    end
  end
end
