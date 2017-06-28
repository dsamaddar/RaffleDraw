Imports System.IO
Imports System.Net

Partial Class frmRaffelDraw
    Inherits System.Web.UI.Page

    Dim CouponData As New clsCoupons()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ClearSelection()
            GetCurrentPrizeNo()
        End If
    End Sub

    Protected Sub GetCurrentPrizeNo()
        Try
            Dim PrizeNo As Integer = CouponData.fnGetCurrentPrizeNo()
            lblPrizeNo.Text = "Prize No : " & PrizeNo.ToString()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnPickUp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPickUp.Click
        Try
            Dim Coupon As New clsCoupons()
            Coupon = CouponData.fnSelectWinner()

            lblEmployeeName.Text = "Congratulation ! " & Coupon.EmployeeName
            lblCouponNo.Text = "Coupon No : " & Coupon.CouponNo
            hdFldCouponNo.Value = Coupon.CouponNo

            If Coupon.Photos = "" Then
                imgWinner.ImageUrl = "~\Sources\images\human.png"
            Else
                ShowImage(ConfigurationManager.AppSettings("OutputEHRMFiles") & Coupon.Photos, "imgWinner")
            End If

            ClearSelection()

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearSelection()
        pnlEmpInfo.Visible = False
        lblDigitOne.Text = "-"
        lblDigitTwo.Text = "-"
        lblDigitThree.Text = "-"
        lblDigitFour.Text = "-"
    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Try
            Dim tClient As WebClient = New WebClient
            Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
            Dim bytesPic As Byte() = memStrmPic.ToArray()
            Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

            Dim imgCtrl As System.Web.UI.WebControls.Image = Me.FindControl(ControlName)
            imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
            memStrmPic.Dispose()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnConfirmSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirmSelection.Click
        Try
            If hdFldCouponNo.Value = "" Then
                MessageBox("Random Selection Required.")
                Exit Sub
            End If

            Dim result As Integer = CouponData.fnUpdateSelection(hdFldCouponNo.Value)

            If result = 1 Then
                MessageBox("Confirmed")
                ConfirmSelection()
                GetCurrentPrizeNo()
            Else
                MessageBox("! Confirmed")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ConfirmSelection()
        pnlEmpInfo.Visible = False
        lblDigitOne.Text = "-"
        lblDigitTwo.Text = "-"
        lblDigitThree.Text = "-"
        lblDigitFour.Text = "-"

        hdFldCouponNo.Value = ""
        lblCouponNo.Text = ""
        lblEmployeeName.Text = ""
        imgWinner.ImageUrl = "~\Sources\images\human.png"
    End Sub

    Protected Sub btnDigitOne_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDigitOne.Click
        Try
            Dim Coupon(3) As Char

            Dim si As New System.Globalization.StringInfo(hdFldCouponNo.Value)

            Dim unicodeTestArray(si.LengthInTextElements) As String
            For i As Integer = 0 To si.LengthInTextElements - 1
                Coupon(i) = si.SubstringByTextElements(i, 1)
            Next

            lblDigitOne.Text = Coupon(0).ToString()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDigitTwo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDigitTwo.Click
        Try
            Dim Coupon(3) As Char

            Dim si As New System.Globalization.StringInfo(hdFldCouponNo.Value)

            Dim unicodeTestArray(si.LengthInTextElements) As String
            For i As Integer = 0 To si.LengthInTextElements - 1
                Coupon(i) = si.SubstringByTextElements(i, 1)
            Next

            lblDigitTwo.Text = Coupon(1).ToString()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDigitThree_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDigitThree.Click
        Try
            Dim Coupon(3) As Char

            Dim si As New System.Globalization.StringInfo(hdFldCouponNo.Value)

            Dim unicodeTestArray(si.LengthInTextElements) As String
            For i As Integer = 0 To si.LengthInTextElements - 1
                Coupon(i) = si.SubstringByTextElements(i, 1)
            Next

            lblDigitThree.Text = Coupon(2).ToString()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnDigitFour_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDigitFour.Click
        Try
            Dim Coupon(3) As Char

            Dim si As New System.Globalization.StringInfo(hdFldCouponNo.Value)

            Dim unicodeTestArray(si.LengthInTextElements) As String
            For i As Integer = 0 To si.LengthInTextElements - 1
                Coupon(i) = si.SubstringByTextElements(i, 1)
            Next

            lblDigitFour.Text = Coupon(3).ToString()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub lblDigitAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblDigitAll.Click
        Try
            Dim Coupon(3) As Char

            Dim si As New System.Globalization.StringInfo(hdFldCouponNo.Value)

            Dim unicodeTestArray(si.LengthInTextElements) As String
            For i As Integer = 0 To si.LengthInTextElements - 1
                Coupon(i) = si.SubstringByTextElements(i, 1)
            Next

            lblDigitOne.Text = Coupon(0).ToString()
            lblDigitTwo.Text = Coupon(1).ToString()
            lblDigitThree.Text = Coupon(2).ToString()
            lblDigitFour.Text = Coupon(3).ToString()

            pnlEmpInfo.Visible = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
