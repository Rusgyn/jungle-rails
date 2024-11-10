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

});

