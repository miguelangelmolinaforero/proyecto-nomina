import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DescuentosComponent } from './descuentos.component';

describe('DescuentosComponent', () => {
  let component: DescuentosComponent;
  let fixture: ComponentFixture<DescuentosComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DescuentosComponent]
    });
    fixture = TestBed.createComponent(DescuentosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
