import {Component,ChangeDetectionStrategy, ViewChild, TemplateRef} from '@angular/core';
import {Router} from '@angular/router';
import {ProjetService} from './services/projet.service';
import {PropositionService} from './services/proposition.service';
import {  CalendarEvent,  CalendarEventAction,  CalendarEventTimesChangedEvent} from 'angular-calendar';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import  * as $ from 'jquery';
import {
  startOfDay,
  endOfDay,
  subDays,
  addDays,
  endOfMonth,
  isSameDay,
  isSameMonth,
  addHours
} from 'date-fns';
import { Subject } from 'rxjs/Subject';

const colors: any = {
  red: {
    primary: '#ad2121',
    secondary: '#FAE3E3'
  },
  blue: {
    primary: '#1e90ff',
    secondary: '#D1E8FF'
  },
  yellow: {
    primary: '#e3bc08',
    secondary: '#FDF1BA'
  }
};

@Component({
    selector : 'calendrier',
    changeDetection: ChangeDetectionStrategy.OnPush,
    templateUrl :'./templates/calendrier.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css',
                '../assets/css/angular-calendar.css']
})

export class CalendrierComponent{ 
    
   view: string = 'month';

  viewDate: Date = new Date();

  modalData: {
    action: string,
    event: CalendarEvent
  };

  rendezVousClickAction : CalendarEventAction[] = [{
    label: '<button class="btn btn-primary"><i class="fa fa-search"></i><button>',
    onClick: ({event}: {event: CalendarEvent}): void => {
      this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['projetDetails',event.objectId]}}]); 
    }
  }];
  projetClickAction : CalendarEventAction[] = [{
    label: '<button class="btn btn-primary"><i class="fa fa-search"></i><button>',
    onClick: ({event}: {event: CalendarEvent}): void => {
      this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['projetDetails',event.objectId]}}]); 
    }
  }];
  activiteClickAction : CalendarEventAction[] = [{
    label: '<button class="btn btn-primary"><i class="fa fa-search"></i><button>',
    onClick: ({event}: {event: CalendarEvent}): void => {
      this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['activiteDetails',event.objectId]}}]); 
    }
  }];

  refresh: Subject<any> = new Subject();
  events: CalendarEvent[]=[];

  activeDayIsOpen: boolean = false;

  constructor(private modal: NgbModal,private propositionService: PropositionService,private projetService:ProjetService,private router:Router) {}

  ngOnInit(){
    this.getAllRendezVous();
    this.getAllProjets();
    this.getAllActivities();
    $('#today').click();
  }

  dayClicked({date, events}: {date: Date, events: CalendarEvent[]}): void {

    if (isSameMonth(date, this.viewDate)) {
      if (
        (isSameDay(this.viewDate, date) && this.activeDayIsOpen === true) ||
        events.length === 0
      ) {
        this.activeDayIsOpen = false;
      } else {
        this.activeDayIsOpen = true;
        this.viewDate = date;
      }
    }
  }

  addEventFromRendezVous(rendezVous): void {  
    this.events.push({
      title: rendezVous.sujet,
      start: startOfDay(this.sqlToJsDate(rendezVous.date)),
      color: colors.blue,
      draggable: true,
      actions: this.rendezVousClickAction,
      objectId : rendezVous.idRendezVous
    });
  }

  addEventFromPrjet(projet){
    this.events.push({
      title: projet.intitule,
      start: startOfDay(this.sqlToJsDate(projet.dateDebut)),
      end: endOfDay(this.sqlToJsDate(projet.dateFin)),
      color: colors.red,
      draggable: true,
      actions: this.projetClickAction,
      objectId: projet.idProjet
    });
  }

  addEventFromActivite(activite){
    this.events.push({
      title: activite.intitule,
      start: startOfDay(this.sqlToJsDate(activite.dateActivite)),
      end: endOfDay(this.sqlToJsDate(activite.dateFin)),
      color: colors.yellow,
      draggable: true,
      actions: this.activiteClickAction,
      objectId : activite.idActivite
    });
  }

  sqlToJsDate(sqlDate){
    //sqlDate in SQL DATETIME format ("yyyy-mm-dd hh:mm:ss.ms")
    var sqlDateArr1 = sqlDate.split("-");
    //format of sqlDateArr1[] = ['yyyy','mm','dd hh:mm:ms']
    var sYear = sqlDateArr1[0];
    var sMonth = sqlDateArr1[1];
    /*var sqlDateArr2 = sqlDateArr1[2].split(" ");
    //format of sqlDateArr2[] = ['dd', 'hh:mm:ss.ms']
    var sDay = sqlDateArr2[0];
    var sqlDateArr3 = sqlDateArr2[1].split(":");
    //format of sqlDateArr3[] = ['hh','mm','ss.ms']
    var sHour = sqlDateArr3[0];
    var sMinute = sqlDateArr3[1];
    var sqlDateArr4 = sqlDateArr3[2].split(".");
    //format of sqlDateArr4[] = ['ss','ms']
    var sSecond = sqlDateArr4[0];
    var sMillisecond = sqlDateArr4[1];*/
    var sDay = sqlDateArr1[2];
    return new Date(sYear,sMonth-1,sDay);
}


  getAllRendezVous(){
    this.propositionService.getAllRendezVous().subscribe(
      rendezVous => {
        rendezVous.forEach(element => {
          this.addEventFromRendezVous(element);
        });
      }
    )
  }

  getAllProjets(){
    this.projetService.getAdminProjets().subscribe(
      projets => {
        projets.forEach(element => {
          this.addEventFromPrjet(element);
        })
      }
    )
  }

  getAllActivities(){
        this.projetService.getAllActivities().subscribe(
          activities => {
        activities.forEach(element => {
          this.addEventFromActivite(element);
        });
          }
        )
  }
}