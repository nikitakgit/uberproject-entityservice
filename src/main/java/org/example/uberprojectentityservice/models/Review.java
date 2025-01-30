package org.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import lombok.*;

@Getter //lombok annotation to create getter ,setter  and builder automatically
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name="booking_review")
@Inheritance(strategy = InheritanceType.JOINED)
public class Review extends BaseModel{

    private String content;

    private double rating;

    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(nullable = false)
    private Booking booking;
}
