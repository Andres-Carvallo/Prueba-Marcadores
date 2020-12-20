module ApplicationHelper
    def category_list(value)
        sub_category_list = [] 
        value.sub_categories.each do |sub_category| 
          sub_category_list.push(sub_category.name)  
        end
        return sub_category_list.join(', ')
    end

    def url_list(value)
        url_list = [] 
        value.urls .each do |url| 
          url_list.push(url.url_name)  
        end
        return url_list.join(', ')
    end

    def bookmark_list(value)
        category_list = [] 
        value.categories .each do |category| 
        category_list.push(category.name) 
        end
        return category_list.join(', ')
    end


end
