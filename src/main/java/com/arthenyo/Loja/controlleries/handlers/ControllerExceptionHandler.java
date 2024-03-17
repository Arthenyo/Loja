package com.arthenyo.Loja.controlleries.handlers;

import com.arthenyo.Loja.customErro.CustomException;
import com.arthenyo.Loja.servicies.excptions.DateBaseException;
import com.arthenyo.Loja.servicies.excptions.ObjectNotFound;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.Instant;

@ControllerAdvice
public class ControllerExceptionHandler {

    @ExceptionHandler(ObjectNotFound.class)
    public ResponseEntity<CustomException> objectNotFound(ObjectNotFound e, HttpServletRequest request) {
        HttpStatus status = HttpStatus.NOT_FOUND;
        CustomException err = new CustomException(Instant.now(), status.value(), e.getMessage(), request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }
    @ExceptionHandler(DateBaseException.class)
    public ResponseEntity<CustomException> dateBaseException(DateBaseException e, HttpServletRequest request){
        HttpStatus status = HttpStatus.NO_CONTENT;
        CustomException err = new CustomException(Instant.now(),status.value(), e.getMessage(), request.getRequestURI());
        return ResponseEntity.status(status).body(err);
    }
}
