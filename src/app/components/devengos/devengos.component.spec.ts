import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DevengosComponent } from './devengos.component';

describe('DevengosComponent', () => {
  let component: DevengosComponent;
  let fixture: ComponentFixture<DevengosComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DevengosComponent]
    });
    fixture = TestBed.createComponent(DevengosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
