describe("The Jungle Rails", () => {
  it("should load the home page", () => {
    cy.visit('/');
    cy.title().should('include', 'Jungle');
    cy.get('.navbar-brand').should('exist')
    cy.contains('Welcome to The Jungle').should('exist');
  });

  it("There is products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("View the product detail", () => {
    cy.visit("/")
    cy.get(".products article").should("be.visible");
    cy.get("img").first().click();
    
    cy.url().should('include', '/products');
    cy.get(".quantity").should('be.visible');

    cy.get(".quantity").invoke('val').then((quantity) => {
      if (parseInt(quantity) === 0) {
        // If quantity is 0, check that "Sold Out" text exists
        cy.contains('Sold Out').should('exist');
      }
    });
  });

  it("should only show the chosen product", () => {
    cy.visit('/');
    cy.get(".products article").should("be.visible");
    cy.get("img").first().click()

    cy.url().then((url) => {
      const first_product = url;

      cy.visit("/");
      cy.get("img").last().click();

      cy.url().should('not.equal', first_product);
      cy.url().should('include', '/products');
      cy.get(".quantity").should('be.visible')
      
      cy.get(".quantity").invoke('val').then((quantity) => {
        if (parseInt(quantity) === 0) {
          // If quantity is 0, check that "Sold Out" text exists
          cy.contains('Sold Out').should('exist');
        } 
      });
    });
  })

});
