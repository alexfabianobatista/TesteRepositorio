unit URExecRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRExecRel = class(TFTRelSimples)
    QRBDetail: TQRBand;
    QRCabec: TQRChildBand;
    QRBSumary: TQRBand;
    QRGroup1: TQRGroup;
    QRGFooter1: TQRBand;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBSumaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure PreparaCampos;
  end;

var
  FRExecRel: TFRExecRel;
  wImprimirSumary : Boolean;

implementation

uses URelatorio_cl;

{$R *.DFM}

{ TFRExecRel }

procedure TFRExecRel.PreparaCampos;
Var wCont : Integer;
    wGroup1: String;
begin
  wGroup1 := '';
  With DMRelatorio do
  Begin
    QRLTitulo.Caption := QRelatorioDesc_Titulo.Value;
    QRLNomeRel.Caption := QRelatorioNome_Relatorio.Value;
    QSelect.Open;
    For wCont := 0 to QExecRel.Fields.Count -1 do
    Begin
      QSelect.Locate('NOME_CAMPO', QExecRel.Fields[wCont].FieldName, []);
      Case Round(QSelectInd_Grupo.Value) of
        0 : Begin
          // Criar cabeçalho
          With TQRLabel.Create(FRExecRel) do
          Begin
            Parent := QRCabec;
            // QSelect.Locate('NOME_CAMPO', QExecRel.Fields[wCont].FieldName, []);
            Caption := QSelectNome_Alias.Value;
            Left := QSelectNum_Pos_X.Value;
            Top := QSelectNum_Pos_Y.Value;
            Width := QSelectNum_Tamanho.Value;
            If QSelectDesc_Alinhamento.Value = 'DIREITA' Then
              Alignment := taRightJustify;
            If QSelectDesc_Alinhamento.Value = 'ESQUERDA' Then
              Alignment := taLeftJustify;
            If QSelectDesc_Alinhamento.Value = 'CENTRALIZADO' Then
              Alignment := taCenter;
            If QRCabec.Height < (Top + Height) Then
              QRCabec.Height := (Top + Height);
          End;

          // Criar campo do Relatorio
          With TQRDBText.Create(FRExecRel) do
          Begin
            Parent := QRBDetail;
            ParentReport := QRPrimario;
            DataSet := DMRelatorio.QExecRel;
            DataField := QExecRel.Fields[wCont].FieldName;
            If QSelectDesc_Tipo_Dado.Value = 'NUMBER' Then
              Alignment := taRightJustify;
            Left := QSelectNum_Pos_X.Value;
            Top := QSelectNum_Pos_Y.Value;
            AutoSize := True;
            Width := QSelectNum_Tamanho.Value;
            If QSelectDesc_Alinhamento.Value = 'DIREITA' Then
              Alignment := taRightJustify;
            If QSelectDesc_Alinhamento.Value = 'ESQUERDA' Then
              Alignment := taLeftJustify;
            If QSelectDesc_Alinhamento.Value = 'CENTRALIZADO' Then
              Alignment := taCenter;
            Mask := QSelectDesc_Mascara.Value;
            If QRBDetail.Height < (Top + Height) Then
              QRBDetail.Height := (Top + Height);
          End;
        End; // Grupo = 0
        1 : Begin // Grupo = 1
          // Criar cabeçalho
          With TQRLabel.Create(FRExecRel) do
          Begin
            Parent := QRGroup1;
            Caption := QSelectNome_Alias.Value;
            Left := QSelectNum_Pos_X.Value;
            Top := QSelectNum_Pos_Y.Value;
            // Width := QSelectNum_Tamanho.Value;
            If QSelectDesc_Alinhamento.Value = 'DIREITA' Then
              Alignment := taRightJustify;
            If QSelectDesc_Alinhamento.Value = 'ESQUERDA' Then
              Alignment := taLeftJustify;
            If QSelectDesc_Alinhamento.Value = 'CENTRALIZADO' Then
              Alignment := taCenter;
          End;

          // Criar campo do grupo 1
          With TQRDBText.Create(FRExecRel) do
          Begin
            Parent := QRGroup1;
            ParentReport := QRPrimario;
            DataSet := DMRelatorio.QExecRel;
            DataField := QExecRel.Fields[wCont].FieldName;
            If QSelectDesc_Tipo_Dado.Value = 'NUMBER' Then
              Alignment := taRightJustify;
            Left := QSelectNum_Pos_X.Value;
            Top := QSelectNum_Pos_Y.Value + 15;
            AutoSize := False;
            Width := QSelectNum_Tamanho.Value;
            If QSelectDesc_Alinhamento.Value = 'DIREITA' Then
              Alignment := taRightJustify;
            If QSelectDesc_Alinhamento.Value = 'ESQUERDA' Then
              Alignment := taLeftJustify;
            If QSelectDesc_Alinhamento.Value = 'CENTRALIZADO' Then
              Alignment := taCenter;
            // Mask := QSelectDesc_Mascara.Value;
            If QRGroup1.Height < (Top + Height+15) Then
              QRGroup1.Height := (Top + Height+15);
          End;

          If wGroup1 = '' Then
            wGroup1 := 'QExecRel.'+QExecRel.Fields[wCont].FieldName
          Else
            wGroup1 := wGroup1 + '+QExecRel.'+QExecRel.Fields[wCont].FieldName;

        End; // Grupo  = 1


      End;
    End;
    QRGroup1.Expression := wGroup1;

    // Criar Totalizações
    QSumary.Open;
    wImprimirSumary := QSumaryCod_Relatorio.Value = QRelatorioCod_Relatorio.Value;
    QSumary.First;
    While not QSumary.Eof do
    Begin
      // Criar sumary
      With TQRExpr.Create(FRExecRel) do
      Begin
        Parent := QRBSumary;
        ParentReport := QRPrimario;
        Expression := 'SUM('+QSumaryNome_Campo.Value+')';
        Left := QSumaryNum_pos_X.Value;
        Top := QSumaryNum_Pos_Y.Value;
        AutoSize := False;
        Width := QSelectNum_Tamanho.Value;
        If QSumaryDesc_Alinhamento.Value = 'DIREITA' Then
          Alignment := taRightJustify;
        If QSumaryDesc_Alinhamento.Value = 'ESQUERDA' Then
          Alignment := taLeftJustify;
        If QSumaryDesc_Alinhamento.Value = 'CENTRALIZADO' Then
          Alignment := taCenter;

        Mask := QSumaryDesc_Mascara.Value;

        If QRBSumary.Height < (Top + Height) Then
          QRBSumary.Height := (Top + Height);
      End;
      // Totalização do Grupo 1
      With TQRExpr.Create(FRExecRel) do
      Begin
        // Name := 'QRExpr'+QSumaryNome_Campo.Value;
        Parent := QRGFooter1;
        ParentReport := QRPrimario;
        Expression := 'SUM('+QSumaryNome_Campo.Value+')';
        Left := QSumaryNum_pos_X.Value;
        Top := QSumaryNum_Pos_Y.Value;
        Width := QSelectNum_Tamanho.Value;
        ResetAfterPrint := True;
        If QSumaryDesc_Alinhamento.Value = 'DIREITA' Then
          Alignment := taRightJustify;
        If QSumaryDesc_Alinhamento.Value = 'ESQUERDA' Then
          Alignment := taLeftJustify;
        If QSumaryDesc_Alinhamento.Value = 'CENTRALIZADO' Then
          Alignment := taCenter;

        AutoSize := False;
        Mask := QSumaryDesc_Mascara.Value;

        If QRGFooter1.Height < (Top + Height) Then
          QRGFooter1.Height := (Top + Height);
      End;
      QSumary.Next;
    End;
    QSumary.Close;
  End;
end;

procedure TFRExecRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FRExecRel := Nil;
end;

procedure TFRExecRel.QRBSumaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := wImprimirSumary;
end;

procedure TFRExecRel.FormCreate(Sender: TObject);
begin
  inherited;
//  QRPrimario.PrinterSettings.Orientation := Printer.Orientation;
//  QRPrimario.Page.Orientation := Printer.Orientation;
end;

end.
