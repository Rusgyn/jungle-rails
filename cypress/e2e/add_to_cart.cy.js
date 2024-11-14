describe("The Jungle Rails", () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it("should load the home page", () => {
    cy.title().should('include', 'Jungle');
    cy.get('.navbar-brand').should('exist')
    cy.contains('Welcome to The Jungle').should('exist');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it('increments cart count when a product is added', () => {
    // Ensure the initial cart count is zero
    cy.get('.navbar').contains('My Cart (0)').should('exist');

    cy.get('.products article').should('be.visible');

    // Click the 'Add to Cart' button for the first product on the page
    cy.wait(1000); // Waits for 1 second
    cy.get('.products article').first().contains('Add').click({ force: true });

    // Verify that the cart count has increased by one
    cy.get('.navbar').contains('My Cart (1)', { timeout: 10000 }).should('exist');
  });

});
