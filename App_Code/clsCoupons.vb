﻿Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCoupons

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Dim _EmployeeID, _EmployeeName, _Photos, _CouponNo As String

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property CouponNo() As String
        Get
            Return _CouponNo
        End Get
        Set(ByVal value As String)
            _CouponNo = value
        End Set
    End Property

    Public Property EmployeeName() As String
        Get
            Return _EmployeeName
        End Get
        Set(ByVal value As String)
            _EmployeeName = value
        End Set
    End Property

    Public Property Photos() As String
        Get
            Return _Photos
        End Get
        Set(ByVal value As String)
            _Photos = value
        End Set
    End Property

    Dim _SLNO As Int32

    Public Property SLNO() As Int32
        Get
            Return _SLNO
        End Get
        Set(ByVal value As Int32)
            _SLNO = value
        End Set
    End Property

    Dim _IsSelected As Boolean

    Public Property IsSelected() As Boolean
        Get
            Return _IsSelected
        End Get
        Set(ByVal value As Boolean)
            _IsSelected = value
        End Set
    End Property

    Dim _SelectionTime As DateTime

    Public Property SelectionTime() As DateTime
        Get
            Return _SelectionTime
        End Get
        Set(ByVal value As DateTime)
            _SelectionTime = value
        End Set
    End Property


#Region " Update Selection "

    Public Function fnUpdateSelection(ByVal CouponNo As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateSelection", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CouponNo", CouponNo)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Select Winner "

    Public Function fnSelectWinner() As clsCoupons
        Dim Coupon As New clsCoupons()
        Dim sp As String = "spSelectWinner"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Coupon.EmployeeID = dr.Item("EmployeeID")
                    Coupon.EmployeeName = dr.Item("EmployeeName")
                    Coupon.Photos = dr.Item("Photos")
                    Coupon.CouponNo = dr.Item("CouponNo")
                End While
                con.Close()
                Return Coupon
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Current Prize No "

    Public Function fnGetCurrentPrizeNo() As Integer
        Dim CurrentPrizeNo As Integer
        Dim sp As String = "spGetCurrentPrizeNo"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                dr = cmd.ExecuteReader()
                While dr.Read()
                    CurrentPrizeNo = dr.Item("CurrentPrizeNo")
                End While
                con.Close()
                Return CurrentPrizeNo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

End Class
