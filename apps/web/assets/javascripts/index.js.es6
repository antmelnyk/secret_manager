document.addEventListener('DOMContentLoaded', function(){ 
    const input = document.querySelector('#search');

    // Category switch
    Array.from(document.getElementsByClassName('category')).forEach(function(element) {
        element.addEventListener('click', function(e) {
            const selectedCategory = e.target.dataset.id;

            for(let c of document.querySelectorAll('.category')) c.classList = 'category';
            e.target.classList = 'category is-active';

            if(selectedCategory == 'all') {
                for(let c of document.querySelectorAll('.secret-item')) c.style.display = 'block';
            } else {
                for(let c of document.querySelectorAll('.secret-item')) c.style.display = 'none';
                for(let c of document.querySelectorAll(`.secret-item[data-category="${selectedCategory}"`)) c.style.display = 'block';
            }
        });
    });

    input.addEventListener('keypress', function (e) {
        for(let c of document.querySelectorAll('.secret-item')) {
            
        }
    })
});
