CREATE TABLE booking_review
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    content    VARCHAR(255)          NULL,
    rating     DOUBLE                NOT NULL,
    booking_id BIGINT                NOT NULL,
    CONSTRAINT pk_booking_review PRIMARY KEY (id)
);

CREATE TABLE passenger_review
(
    id                       BIGINT       NOT NULL,
    passenger_review_comment VARCHAR(255) NULL,
    passenger_rating         VARCHAR(255) NULL,
    CONSTRAINT pk_passengerreview PRIMARY KEY (id)
);

ALTER TABLE driver
    ADD active_city VARCHAR(255) NULL;

ALTER TABLE driver
    ADD driver_approval_status ENUM('APPROVED','DENIED','PENDING') NULL;

ALTER TABLE driver
    ADD rating DOUBLE NULL;

ALTER TABLE driver
    MODIFY rating DOUBLE NOT NULL;

ALTER TABLE booking_review
    ADD CONSTRAINT uc_booking_review_booking UNIQUE (booking_id);

ALTER TABLE booking_review
    ADD CONSTRAINT FK_BOOKING_REVIEW_ON_BOOKING FOREIGN KEY (booking_id) REFERENCES booking (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_ID FOREIGN KEY (id) REFERENCES booking_review (id);

ALTER TABLE driver
    ADD CONSTRAINT check_rating CHECK ( driver.rating>=0 AND driver.rating<=5);