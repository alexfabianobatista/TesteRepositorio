unit URelatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, ActnList;

type
  TFRelatorio = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SBRelatorio: TSpeedButton;
    SBCriaRel: TSpeedButton;
    Memo1: TMemo;
    BtMostaSQL: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    FDFonte: TFontDialog;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormActivate(Sender: TObject);
    procedure SBRelatorioClick(Sender: TObject);
    procedure SBCriaRelClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtMostaSQLClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio: TFRelatorio;

implementation

uses URelatorio_cl, UReporterWiz, URelatorioVar, UOracle_cl,
  URelatorioCons, URExecRel, URExecRel_paisagem;

{$R *.DFM}

procedure TFRelatorio.FormActivate(Sender: TObject);
begin
  inherited;
  With DMRelatorio do
  Begin
    QRelatorio.SetVariable('PK',1);
    QRelatorio.Open;
  End;
end;

procedure TFRelatorio.SBRelatorioClick(Sender: TObject);
Var wOk : Boolean;
begin
  inherited;
  With DMRelatorio do
  Begin
    wOk := True;
    QWhere.Open;
    QWhere.First;
    If FRelatorioVar = Nil then
      FRelatorioVar := TFRelatorioVar.Create(Self);
    FRElatorioVar.MVar.Lines.Clear;
    While Not QWhere.Eof do
    Begin
      If DMRelatorio.QWhereCod_Relatorio.Value = DMRelatorio.QRelatorioCod_Relatorio.Value then
      Begin
        If FRelatorioVar.ShowModal <> mrOk then
          wOk := False;
        // Depois do ShowModal o Qwhere estara no EOF
      End;
    End;

    If wOk Then
    Begin
      DMRelatorio.GeraSQL(FRElatorioVar.MVar.Lines);
      Memo1.Lines := QExecRel.SQL;
      If QRelatorioDesc_Orientacao.Value = 'RETRATO' Then
      Begin
        If FRExecRel = Nil then
          FRExecRel := TFRExecRel.Create(Self);
        FRExecRel.PreparaCampos;
        If QRelatorioNome_Fonte.Value <> '' then
        Begin
          FRExecRel.QRPrimario.Font.Name := QRelatorioNome_Fonte.Value;
          FRExecRel.QRPrimario.Font.Size := Round(QRelatorioNum_Tamanho_fonte.Value);
        End;
        FRExecRel.QRPrimario.Preview;
        FRExecRel.Release;
        FRExecRel := Nil;
      End
      Else
      Begin  // PAISAGEM
        If FRExecRel_paisagem = Nil then
          FRExecRel_paisagem := TFRExecRel_paisagem.Create(Self);
        FRExecRel_paisagem.PreparaCampos;
        If QRelatorioNome_Fonte.Value <> '' then
        Begin
          FRExecRel_paisagem.QRPrimario.Font.Name := QRelatorioNome_Fonte.Value;
          FRExecRel_paisagem.QRPrimario.Font.Size := Round(QRelatorioNum_Tamanho_fonte.Value);
        End;
        FRExecRel_paisagem.QRPrimario.Preview;
        FRExecRel_paisagem.Release;
        FRExecRel_paisagem := Nil;
      End;
    End;
  End;

end;

procedure TFRelatorio.SBCriaRelClick(Sender: TObject);
begin
  inherited;
  If FReporterWiz = Nil then
    FReporterWiz := TFReporterWiz.Create(Self);
  DMOracle.DBCemapa.StartTransaction;
  If FReporterWiz.ShowModal = mrOk Then
    DMOracle.DBCemapa.Commit
  Else
    DMOracle.DBCemapa.RollBack;

end;

procedure TFRelatorio.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRelatorioCons = Nil then
    FRelatorioCons := TFRelatorioCons.Create(Self);
  If FRelatorioCons.ShowModal = mrOk then
  With DMRelatorio do
  Begin
    QRelatorio.Close;
    QRelatorio.SetVariable('PK',QRelatorioConsCod_Relatorio.Value);
    QRelatorio.Open;
  End;
end;

procedure TFRelatorio.BtMostaSQLClick(Sender: TObject);
begin
  inherited;
  Memo1.Visible := Not Memo1.Visible;
end;

procedure TFRelatorio.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FDFonte.Font.Name := DMRelatorio.QRelatorioNome_Fonte.Value;
  FDFonte.Font.Size := Trunc(DMRelatorio.QRelatorioNum_Tamanho_Fonte.Value);

  If FDFonte.Execute then
  With DMRelatorio do
  Begin
    QRelatorio.Edit;
    QRelatorioNome_Fonte.Value := FDFonte.Font.Name;
    QRelatorioNum_tamanho_Fonte.Value := FDFonte.Font.Size;    
    QRelatorio.Post;
  End;
end;

end.
