import { FondationNorsysAdminPage } from './app.po';

describe('fondation-norsys-admin App', () => {
  let page: FondationNorsysAdminPage;

  beforeEach(() => {
    page = new FondationNorsysAdminPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
