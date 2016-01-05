VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   Caption         =   "AstroGrep"
   ClientHeight    =   4815
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7740
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4815
   ScaleWidth      =   7740
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraResults 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   255
      Left            =   120
      TabIndex        =   24
      Top             =   1800
      Width           =   1935
      Begin VB.Label lblResults 
         Appearance      =   0  'Flat
         Caption         =   "Results:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   0
         TabIndex        =   25
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.Frame fraSearching 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1695
      Left            =   120
      TabIndex        =   18
      Top             =   3000
      Width           =   5535
      Begin VB.CommandButton btnCancel 
         Caption         =   "&Cancel"
         Height          =   315
         Left            =   4560
         TabIndex        =   12
         Top             =   1320
         Width           =   915
      End
      Begin VB.Label lblExpression 
         Height          =   252
         Left            =   0
         TabIndex        =   28
         Top             =   240
         Width           =   5412
      End
      Begin VB.Label Label6 
         Caption         =   "Searching..."
         Height          =   252
         Left            =   0
         TabIndex        =   23
         Top             =   0
         Width           =   972
      End
      Begin VB.Label lblSearchFile 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   288
         Left            =   480
         TabIndex        =   22
         Top             =   960
         Width           =   4932
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Path:"
         Height          =   192
         Left            =   0
         TabIndex        =   21
         Top             =   600
         Width           =   372
      End
      Begin VB.Label lblSearchDirectory 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   288
         Left            =   480
         TabIndex        =   20
         Top             =   600
         Width           =   4932
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "File:"
         Height          =   192
         Left            =   0
         TabIndex        =   19
         Top             =   960
         Width           =   288
      End
   End
   Begin VB.Frame fraMain 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1815
      Left            =   225
      TabIndex        =   14
      Top             =   0
      Width           =   7020
      Begin VB.CheckBox chkMatchOnly 
         Appearance      =   0  'Flat
         Caption         =   "Match Only"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5175
         TabIndex        =   30
         ToolTipText     =   "Use ""regular expression"" matching"
         Top             =   1485
         Width           =   1320
      End
      Begin VB.TextBox lblContextLines 
         Height          =   285
         Left            =   2880
         TabIndex        =   29
         Text            =   "0"
         Top             =   1395
         Width           =   420
      End
      Begin VB.CheckBox chkFileNamesOnly 
         Appearance      =   0  'Flat
         Caption         =   "Show file names only"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   2880
         TabIndex        =   9
         ToolTipText     =   "Show names but not contents of files that have matches (may be faster on large files)"
         Top             =   1170
         Width           =   1935
      End
      Begin VB.CheckBox chkRecurse 
         Appearance      =   0  'Flat
         Caption         =   "Recurse"
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   1485
         TabIndex        =   8
         ToolTipText     =   "Search in sub-directories"
         Top             =   1125
         Value           =   1  'Checked
         Width           =   975
      End
      Begin VB.CheckBox chkWholeWordOnly 
         Appearance      =   0  'Flat
         Caption         =   "Whole word"
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   0
         TabIndex        =   6
         ToolTipText     =   "Only match entire words (not parts of words)"
         Top             =   1125
         Width           =   1332
      End
      Begin VB.ComboBox cboSearchForText 
         Height          =   315
         Left            =   960
         TabIndex        =   3
         Top             =   720
         Width           =   3550
      End
      Begin VB.CheckBox chkRegularExpressions 
         Appearance      =   0  'Flat
         Caption         =   "Regular Expressions"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   4815
         TabIndex        =   4
         ToolTipText     =   "Use ""regular expression"" matching"
         Top             =   1170
         Width           =   1815
      End
      Begin VB.ComboBox cboFilePath 
         Height          =   315
         Left            =   945
         OLEDropMode     =   1  'Manual
         TabIndex        =   1
         Top             =   0
         Width           =   4530
      End
      Begin VB.CommandButton btnSearch 
         Appearance      =   0  'Flat
         Caption         =   "&Search"
         Default         =   -1  'True
         Height          =   315
         Left            =   4560
         TabIndex        =   10
         Top             =   360
         Width           =   915
      End
      Begin VB.CommandButton btnExit 
         Appearance      =   0  'Flat
         Caption         =   "E&xit"
         Height          =   315
         Left            =   4560
         TabIndex        =   11
         Top             =   720
         Width           =   915
      End
      Begin VB.CheckBox chkCaseSensitive 
         Appearance      =   0  'Flat
         Caption         =   "Case sensitive"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   0
         TabIndex        =   5
         ToolTipText     =   "Match upper and lower case letters exactly"
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CheckBox chkLineNumbers 
         Appearance      =   0  'Flat
         Caption         =   "Line numbers"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1485
         TabIndex        =   7
         ToolTipText     =   "Include line numbers before each match"
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1332
      End
      Begin VB.CommandButton btnBrowse 
         Caption         =   "&Path..."
         Height          =   315
         Left            =   0
         TabIndex        =   0
         Top             =   0
         Width           =   915
      End
      Begin VB.ComboBox cboFileName 
         Appearance      =   0  'Flat
         Height          =   315
         ItemData        =   "frmMain.frx":030A
         Left            =   960
         List            =   "frmMain.frx":032F
         TabIndex        =   2
         Top             =   360
         Width           =   3550
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Search Text:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   0
         TabIndex        =   17
         Top             =   765
         Width           =   915
      End
      Begin VB.Label lblContext 
         Appearance      =   0  'Flat
         Caption         =   "Context lines"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3375
         TabIndex        =   16
         ToolTipText     =   "Show lines above and below the word matched"
         Top             =   1440
         Width           =   930
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "File Name(s):"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   0
         TabIndex        =   15
         Top             =   420
         Width           =   915
      End
   End
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      Height          =   615
      Left            =   5265
      ScaleHeight     =   267.797
      ScaleMode       =   0  'User
      ScaleWidth      =   780
      TabIndex        =   27
      Top             =   2025
      Visible         =   0   'False
      Width           =   72
   End
   Begin VB.ListBox lstFileNames 
      Appearance      =   0  'Flat
      Height          =   705
      IntegralHeight  =   0   'False
      Left            =   120
      MultiSelect     =   2  'Extended
      TabIndex        =   26
      Top             =   2160
      Width           =   1935
   End
   Begin RichTextLib.RichTextBox txtHits 
      Height          =   705
      Left            =   2160
      TabIndex        =   13
      Top             =   2160
      Width           =   2115
      _ExtentX        =   3731
      _ExtentY        =   1244
      _Version        =   393217
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   3
      Appearance      =   0
      RightMargin     =   99999
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmMain.frx":03BB
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Image imgSplitter 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   960
      Left            =   2070
      MousePointer    =   9  'Size W E
      Top             =   1935
      Width           =   75
   End
   Begin VB.Menu mnuTools 
      Caption         =   "&Tools"
      Begin VB.Menu mnuSelectAll 
         Caption         =   "&Select All"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu mEditAll 
         Caption         =   "&Edit selected files"
      End
      Begin VB.Menu seperator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOptions 
         Caption         =   "&Options..."
      End
      Begin VB.Menu mnuClearMRU 
         Caption         =   "&Clear MRU list"
      End
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "&About..."
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' AstroGrep File Searching Utility. Written by Theodore L. Ward
' Copyright (C) 2002 AstroComma Incorporated.
'
' This program is free software; you can redistribute it and/or
' modify it under the terms of the GNU General Public License
' as published by the Free Software Foundation; either version 2
' of the License, or (at your option) any later version.
'
' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.
'
' You should have received a copy of the GNU General Public License
' along with this program; if not, write to the Free Software
' Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
' The author may be contacted at:
' TheodoreWard@Hotmail.com or TheodoreWard@Yahoo.com

Option Explicit

Const GBORDER_SIZE = 120
Const SGLSPLITLIMIT = 500

Dim mbMoving As Boolean

Private Sub btnBrowse_Click()
    Dim dlg As New clsCmnDlg
    Dim pth As String
    pth = dlg.FolderDialog(, Me.hWnd)
    If Len(pth) = 0 Then Exit Sub
    Me.cboFilePath.Text = pth
End Sub

Private Sub btnCancel_Click()
    SetSearch False
End Sub

Private Sub btnExit_Click()
    UpdateRegistrySettings
    End
End Sub

Private Function VerifyInterface() As Boolean

    VerifyInterface = False
    On Error GoTo contexterror
    If Me.lblContextLines.Text < 0 Or Me.lblContextLines.Text > 9 Then
contexterror:
        MsgBox "Number of context lines must be between 0 and 9", vbOKOnly + vbCritical, "Error"
        Exit Function
    End If
    VerifyInterface = True
End Function
Private Sub btnSearch_Click()
    Dim path As String
    Dim fn As String
    Dim i As Integer
    Dim expression As String
    
    If VerifyInterface = False Then Exit Sub
    
    fn = Me.cboFileName.Text
    path = Trim(cboFilePath.Text)
    expression = Trim(cboSearchForText)
    
    'AddPathComboSelection Path
    AddComboSelection frmMain.cboSearchForText, expression
    AddComboSelection frmMain.cboFileName, fn
    AddComboSelection frmMain.cboFilePath, path
    
    ' Ensure that there is a backslash.
    If Right$(path, 1) <> "\" Then path = path & "\"
    
    For i = Len(fn) To 1 Step -1
        If Mid$(fn, i, 1) = "\" Then
            path = Left$(fn, i)
            fn = Right$(fn, Len(fn) - i)
            Exit For
        End If
    Next i
    
    Call Search(path, fn, expression)
    
End Sub

Sub AddComboSelection(cbo As ComboBox, newItem As String)
    Dim i As Integer
    
    ' If this path is already in the dropdown, remove it.
    For i = 0 To cbo.ListCount - 1
        If cbo.List(i) = newItem Then
            cbo.RemoveItem i
            Exit For
        End If
    Next i
    
    ' Add this path as the first item in the dropdown.
    cbo.AddItem newItem, 0
    
    ' The combo text gets cleared by the AddItem.
    cbo.Text = newItem
    
    ' Only store as many paths as has been set in options.
    If cbo.ListCount > NUM_STORED_PATHS Then
        ' Remove the last item in the list.
        cbo.RemoveItem cbo.ListCount - 1
    End If
    
End Sub

'dzzie drag and drop support for path (file of dir)
Private Sub cboFilePath_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error GoTo hell
    
    Dim pth As String
    pth = Data.Files(1)
    
    If FolderExists(pth) Then
        cboFilePath.Text = pth
    ElseIf FileExists(pth) Then
        cboFilePath.Text = GetParentFolder(pth)
        cboFileName.Text = FileNameFromPath(pth)
    End If
    
hell:
    
End Sub

Private Sub chkFileNamesOnly_Click()
    If chkFileNamesOnly.Value Then
        chkLineNumbers.Enabled = False
        lblContextLines.Enabled = False
        'UpDown1.Enabled = False
    Else
        chkLineNumbers.Enabled = True
        lblContextLines.Enabled = True
        'UpDown1.Enabled = True
    End If
End Sub

Private Sub Form_Load()

    '***************
    'Define globals.
    '***************
    
    GB_CANCEL = 0   ' Global variable used to cancel a search.
    
    cboFileName.ListIndex = 0
    
    fraMain.Top = 120
    fraMain.Left = 120
    fraMain.Visible = True
    
    fraSearching.Top = 120
    fraSearching.Left = 120
    fraSearching.Visible = False

    LoadRegistrySettings
    
    ' For some reason these controls were hiding under eachother on some systems.
    'lblContextLines.Left = UpDown1.Left + UpDown1.Width + 10
    
    FormPos Me, True
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode = 0 Then
        UpdateRegistrySettings
    End If
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    
    ' Resize the splitter window.
    If Me.Width < 3000 Then Me.Width = 3000
    SizeControls imgSplitter.Left

    ' Resize controls on main window.
    fraMain.Width = Me.Width - 100
    cboFilePath.Width = fraMain.Width - cboFileName.Left - 300
    cboFileName.Width = fraMain.Width - cboFileName.Left - btnSearch.Width - 400
    cboSearchForText.Width = fraMain.Width - cboFileName.Left - btnExit.Width - 400
    btnSearch.Left = fraMain.Width - btnSearch.Width - 300
    btnExit.Left = fraMain.Width - btnExit.Width - 300
    
    ' Resize controls on window that displays during search.
    fraSearching.Width = Me.Width - 100
    lblSearchDirectory.Width = fraSearching.Width - lblSearchDirectory.Left - 300
    lblSearchFile.Width = fraSearching.Width - lblSearchFile.Left - 300
End Sub

Private Sub Form_Unload(Cancel As Integer)
    FormPos Me, True, True
End Sub

Private Sub lstFileNames_Click()
    Dim ho As CHitObject
    Set ho = G_HITS.Item(lstFileNames.ListIndex + 1)
    frmMain.txtHits.TextRTF = ho.GetHitString()
    'frmMain.sbStatusBar.Panels(1).Text = ho.path
    
    Set ho = Nothing
End Sub

Private Sub lstFileNames_DblClick()
    Dim FileName As String

    FileName = G_HITS.Item(lstFileNames.ListIndex + 1).path + _
        G_HITS.Item(lstFileNames.ListIndex + 1).FileName
    
    ' Open the default editor.
    EditFile FileName, 1
End Sub

Private Sub mEditAll_Click()
    Dim i As Long
    Dim FileName As String

    For i = 0 To lstFileNames.ListCount - 1
        If lstFileNames.Selected(i) Then
            FileName = G_HITS.Item(i + 1).path + G_HITS.Item(i + 1).FileName
    
            ' Open the default editor.
            EditFile FileName, 1
        End If
    Next i
        
End Sub

Private Sub mnuAbout_Click()
    frmAbout.Show 1
End Sub

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    With imgSplitter
        picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
    End With
    picSplitter.Visible = True
    mbMoving = True
End Sub

Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim sglPos As Single

    If mbMoving Then
        sglPos = X + imgSplitter.Left
        If sglPos < SGLSPLITLIMIT Then
            picSplitter.Left = SGLSPLITLIMIT
        ElseIf sglPos > Me.Width - SGLSPLITLIMIT Then
            picSplitter.Left = Me.Width - SGLSPLITLIMIT
        Else
            picSplitter.Left = sglPos
        End If
    End If
End Sub

Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SizeControls picSplitter.Left
    picSplitter.Visible = False
    mbMoving = False
End Sub

Sub SizeControls(X As Single)
    On Error Resume Next
    Const SPLITTERSIZE = 40
    Dim statusBarheight As Integer

    'If sbStatusBar.Visible = True Then
    '    sbStatusBar.Panels.Item(1).Width = frmMain.Width - 500
    '    statusBarheight = sbStatusBar.Height
    'Else
        statusBarheight = 0
    'End If
    
    'set the width
    If X < 1500 Then X = 1500
    If X > (Me.Width - 1500) Then X = Me.Width - 1500
    lstFileNames.Left = GBORDER_SIZE
    lstFileNames.Width = X - GBORDER_SIZE ' + 15
    
    imgSplitter.Left = X
    
    txtHits.Left = lstFileNames.Width + GBORDER_SIZE + imgSplitter.Width
     
    txtHits.Width = Me.ScaleWidth - (txtHits.Left + GBORDER_SIZE)
    
    'set the top
    lstFileNames.Top = fraMain.Height + GBORDER_SIZE * 2
    txtHits.Top = lstFileNames.Top
   
    'set the height
    lstFileNames.Height = Me.ScaleHeight - fraMain.Height - GBORDER_SIZE * 3 - statusBarheight

    txtHits.Height = lstFileNames.Height
    imgSplitter.Top = lstFileNames.Top
    imgSplitter.Height = lstFileNames.Height
End Sub

Private Sub mnuClearMRU_Click()
    ClearRegistrySettings
End Sub

Private Sub mnuOptions_Click()
    frmProperties.Show vbModal
End Sub

Private Sub mnuSelectAll_Click()
    Dim i As Integer
    Dim sel As Integer

    sel = Me.lstFileNames.ListIndex
    
    For i = 0 To Me.lstFileNames.ListCount - 1
        Me.lstFileNames.Selected(i) = True
    Next i
    
    Me.lstFileNames.ListIndex = sel
End Sub

Private Sub txtHits_DblClick()
    Dim i As Long
    Dim FileName As String
    Dim LineNum As Long
    
    ' Make sure there is something to click on.
    If G_HITS.Count = 0 Then Exit Sub
    
    ' Find out the line number the cursor is on.
    i = txtHits.GetLineFromChar(txtHits.SelStart) + 1
    
    ' Use the cursor's linenumber to get the hit's line number.
    LineNum = G_HITS.Item(lstFileNames.ListIndex + 1).GetHitLineNumber(i)
    
    FileName = G_HITS.Item(lstFileNames.ListIndex + 1).path + _
        G_HITS.Item(lstFileNames.ListIndex + 1).FileName
    
    ' Open the default editor.
    EditFile FileName, LineNum
    
End Sub

 
