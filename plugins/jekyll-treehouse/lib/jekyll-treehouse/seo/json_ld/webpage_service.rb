# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class WebpageService < Service

          attributes :context

          def call
            @page = context['page']
            @lang = @page['lang']

            {
              "@type": ["WebPage", "FAQPage"],
              "@id": id,
              "url": url,
              "inLanguage": in_language,
              "name": name,
              "isPartOf": is_part_of,
              "primaryImageOfPage": primary_image_of_page,
              "datePublished": date_published,
              "dateModified": date_modified,
              "description": description
              # "breadcrumb": breadcrumb
            }
          end

          private

          def id
            "#{@page['url']}#webpage"
          end

          def url
            @page['url']
          end

          def in_language
            @page['full-lang']
          end

          def name
            @page['title']
          end

          def is_part_of
            base_url = ['/', @lang, '/'].join.sub('//', '/')

            {
              "@id": "#{base_url}#website"
            }
          end

          def primary_image_of_page
            {
              "@id": "#{url}#primaryimage"
            }
          end

          def date_published
            @page['date']
          end

          def date_modified
            @page['date']
          end

          def description
            @page['description']
          end

          def breadcrumb
            {
              "@id": "#{url}#breadcrumb"
            }
          end
        end
      end
    end
  end
end
