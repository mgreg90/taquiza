@taquiza_menu = {
  restaurant: 'Taquiza',
  address: '1506 Collins Ave',
  menu: {
    sections: [
      {
        name: 'TACOS',
        description: 'FRESHLY MADE BLUE CORN TORTILLAS',
        items: [
          {
            name: 'AL PASTOR',
            ingredients: ['pork', 'achiote', 'pineapple'],
            price: 3.5
          }, {
            name: 'CARNITAS',
            ingredients: ['pork', 'orange', 'cinnamon'],
            price: 3.5
          }, {
            name: 'CHORIZO',
            ingredients: ['pork', 'paprika', 'cumin', 'garlic'],
            price: 3.5
          }
        ]
      },
      {
        name: 'BREAKFAST',
        description: 'EVERYDAY 8 AM - 11:30 AM',
        items: [
          {
            name: 'HUEVOS A LA MEXICANA',
            ingredients: ['scrambled eggs', 'pico', 'frijoles', 'crema', 'tortillas'],
            price: 5.0
          }, {
            name: 'QUESADILLAS DE EPAZOTE',
            ingredients: ['queso chihuahua', 'cotija', 'epazote', 'pico', 'frijoles'],
            price: 5.0
          }, {
            name: 'TOSTADA DE AGUACATE',
            ingredients: ['avocado', 'egg', 'frijoles', 'cabbage', 'cotija'],
            price: 6.0
          }
        ]
      },
      {
        name: 'SIDES/ANTOJITOS',
        items: [
          {
            name: 'TOTOPOS',
            ingredients: ['hand torn blue masa chips'],
            price: 5.0,
            options: [
              {name: 'guac', additional_price: 2.0},
              {name: 'frijoles', additional_price: 2.0},
              {name: 'salsa', additional_price: 1.5}
            ]
          }, {
            name: 'ELOTE',
            ingredients: ['charred corn', 'cilantro-jalapeno crema', 'cotija'],
            price: 5.0
          }, {
            name: 'QUINOA',
            ingredients: ['jicama', 'corn', 'scallion', 'chile', 'nopal dressing'],
            price: 6.5
          }
        ]
      }, {
        name: 'COFFEE & TEA',
        items: [
          {
            name: 'ESPRESSO',
            price: 0.0,
            options: [
              {name: 'shot', additional_price: 3.0},
              {name: 'cortado', additional_price: 4.0},
              {name: 'latte', additional_price: 5.0}
            ]
          }, {
            name: 'LA ENDULZADA',
            ingredients: ['espresso', 'condensed milk', 'ice', 'shaken'],
            price: 5
          }, {
            name: 'GREEN TEA',
            ingredients: ['Jasmine Cloud by JoJo Tea'],
            price: 3
          }
        ]
      }
    ]
  }
}
