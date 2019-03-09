document.addEventListener('DOMContentLoaded', function(){ 
    const input = document.querySelector('#search');

    // Category switch
    Array.from(document.getElementsByClassName('category')).forEach(function(element) {
        element.addEventListener('click', function(e) {
            const selectedCategory = e.target.dataset.id;

            for(let category of document.querySelectorAll('.category')) category.classList = 'category';
            e.target.classList = 'category is-active';

            if(selectedCategory == 'all') {
                for(let item of document.querySelectorAll('.secret-item')) item.style.display = 'block';
            } else {
                for(let item of document.querySelectorAll('.secret-item')) item.style.display = 'none';
                for(let item of document.querySelectorAll(`.secret-item[data-category="${selectedCategory}"`))
                    item.style.display = 'block';
            }
        });
    });

    // Search bar
    input.addEventListener('keyup', function (e) {
        document.querySelector('[data-id="all"]').click();
        for(let item of document.querySelectorAll('.secret-item')) item.style.display = 'none';
                
        if(e.target.keycode == 8 && input.value.length == 0) {
            for(let item of document.querySelectorAll('.secret-item')) item.style.display = 'block';
        } else {
            for(let searchable of document.querySelectorAll('.search-item')) {
                if(searchable.innerHTML.includes(input.value))
                    searchable.closest('.secret-item').style.display = 'block';
            }
        }
    })
    
});
