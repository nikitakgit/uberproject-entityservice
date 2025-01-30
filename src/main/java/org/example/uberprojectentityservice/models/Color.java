package org.example.uberprojectentityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Color extends BaseModel{
   @Column(unique=true,nullable=false)
    private String name;
}
