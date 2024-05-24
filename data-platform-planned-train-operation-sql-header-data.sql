CREATE TABLE `data_platform_planned_train_operation_header_data`
(
  `RailwayLine`                  int(16) NOT NULL,
  `TrainOperationVersion`        int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `PlannedTrainOperationID`      int(4) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `DepartureStation`             int(16) NOT NULL,
  `DestinationStation`           int(16) NOT NULL,
  `PlannedDepartureTime`         time NOT NULL,
  `PlannedArrivalTime`           time NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `OperationCode`                varchar(40) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `PlannedTrainOperationID`),

    CONSTRAINT `DPFMPlannedTrainOperationHeaderData_fk` FOREIGN KEY (`RailwayLine`) REFERENCES `data_platform_railway_line_header_data` (`RailwayLine`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataWeekdayType_fk` FOREIGN KEY (`RailwayLine`, `WeekdayType`) REFERENCES `data_platform_railway_line_weekday_type_data` (`RailwayLine`, `WeekdayType`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataExpressType_fk` FOREIGN KEY (`RailwayLine`, `ExpressType`) REFERENCES `data_platform_railway_line_express_type_data` (`RailwayLine`, `ExpressType`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataDptStation_fk` FOREIGN KEY (`RailwayLine`, `DepartureStation`) REFERENCES `data_platform_station_header_data` (`RailwayLine`, `Station`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataDstStation_fk` FOREIGN KEY (`RailwayLine`, `DestinationStation`) REFERENCES `data_platform_station_header_data` (`RailwayLine`, `Station`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataDptDstStation_fk` FOREIGN KEY (`RailwayLine`, `DepartureStation`, `DestinationStation`) REFERENCES `data_platform_station_header_data` (`RailwayLine`, `DepartureStation`, `DestinationStation`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMPlannedTrainOperationHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
