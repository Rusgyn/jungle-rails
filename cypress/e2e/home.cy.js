describe("Home Page", () => {
  it("should load the home page", () => {
    cy.visit('http://localhost:3000');
    cy.title().should('include', 'Jungle');
    cy.get('.navbar-brand').should('exist')
    cy.contains('Welcome to The Jungle').should('exist');
  });

});