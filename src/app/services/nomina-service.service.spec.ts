import { TestBed } from '@angular/core/testing';

import { NominaServiceService } from './nomina-service.service';

describe('NominaServiceService', () => {
  let service: NominaServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(NominaServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
