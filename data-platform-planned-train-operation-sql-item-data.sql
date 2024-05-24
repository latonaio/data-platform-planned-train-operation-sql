CREATE TABLE `data_platform_planned_train_operation_item_data`
(
  `RailwayLine`                  int(16) NOT NULL,
  `TrainOperationVersion`        int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `PlannedTrainOperationID`      int(4) NOT NULL,
  `RailwayLineStationID`         int(4) NOT NULL,
  `StopStation`                  int(16) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `PlannedArrivalTime`           time DEFAULT NULL,
  `PlannedDepartureTime`         time NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `PlannedTrainOperationID`, `RailwayLineStationID`),

    CONSTRAINT `DPFMPlannedTrainOperationItemData_fk` FOREIGN KEY (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `PlannedTrainOperationID`) REFERENCES `data_platform_planned_train_operation_header_data` (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `PlannedTrainOperationID`),
    CONSTRAINT `DPFMPlannedTrainOperationItemDataStopStation_fk` FOREIGN KEY (`RailwayLine`, `RailwayLineStationID`, `StopStation`) REFERENCES `data_platform_railway_line_stop_station_data` (`RailwayLine`, `RailwayLineStationID`, `StopStation`),
    CONSTRAINT `DPFMPlannedTrainOperationItemDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMPlannedTrainOperationItemDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
