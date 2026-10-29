unit UNotaExplicativaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBPanel;

type
  TFNotaExplicativaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBPanelFilial: TDBPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    dbmNotaExplicativa: TDBMemo;
    NotaExplicativa1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPanelFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBConsultaClick(Sender: TObject);
    procedure NotaExplicativa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaExplicativaCad: TFNotaExplicativaCad;

implementation
uses UPlanilha_cl, UFilialCons, UFilial_cl, UNotaExplicativaCons,
  URNotaExplicativa, UContabilParam, Math, URNotaExplicativaAux,
  UOracle_cl;
{$R *.dfm}

procedure TFNotaExplicativaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPlanilha.QNotaExplicativa.Open;
end;

procedure TFNotaExplicativaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPlanilha.QNotaExplicativa.Close;
  Action := caFree;
  FNotaExplicativaCad := Nil;
end;

procedure TFNotaExplicativaCad.DBPanelFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFNotaExplicativaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNotaExplicativaCons = nil then
    FNotaExplicativaCons := TFNotaExplicativaCons.Create(Application);
  if FNotaExplicativaCons.ShowModal = MrOK then
  with DMPlanilha do
  begin
    QNotaExplicativa.Close;
    QNotaExplicativa.SetVariable('PK',QNotaExplicativaConsCOD_NOTA_EXPLICATIVA.Value);
    QNotaExplicativa.Open;
  end;
end;

procedure TFNotaExplicativaCad.NotaExplicativa1Click(Sender: TObject);
var
  i: integer;
  linha: string;
  quebra: boolean;
begin
  inherited;
  with DMPlanilha do
  begin

    if QNotaExplicativa.eof then
    begin
      MessageDlg('Nenhuma nota explicativa selecionada', mtError, [mbOk], 0);
      exit;
    end;

    if FContabilParam = Nil then
      FContabilParam := TFContabilParam.Create(Application);
    FContabilParam.ME3CodFilial.Text := QNotaExplicativaCOD_FILIAL.Text;

    QRNotaExplicativa.Close;
    QRNotaExplicativa.SetVariable('COD_FILIAL', QNotaExplicativaCOD_FILIAL.Text);
    QRNotaExplicativa.SetVariable('NUM_ANO', QNotaExplicativaNUM_ANO.Text);
    QRNotaExplicativa.Open;

    if FRNotaExplicativaAux = Nil then
      FRNotaExplicativaAux := TFRNotaExplicativaAux.Create(Application);
    FRNotaExplicativaAux.QRLTitulo.Caption := 'NOTAS EXPLICATIVAS';
    FRNotaExplicativaAux.QRLEmpresa.Caption := dmOracle.FastSelect('DESC_FILIAL'
      , 'TB_FILIAL', 'COD_FILIAL = ' + QNotaExplicativaCOD_FILIAL.Text);

    i := 1;
    linha := '';
    quebra := false;
    while i < Length(QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString) do
    begin

      if quebra then
      begin
        if QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString[i] = ' ' then
          Inc(i);
        quebra := false;
      end;

      if Length(linha) > 107 then
      begin
        FRNotaExplicativaAux.QRMemo1.Lines.Add(linha);
        linha := '';
        quebra := true;
        continue;
      end;

      if (QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString[i] <> #$D)
        and (QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString[i] <> #$A) then
        linha:= linha + QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString[i];
      if QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString[i] = #$D then
      begin
        FRNotaExplicativaAux.QRMemo1.Lines.Add(linha);
        linha := '';
        if QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString[i] = #$A then
          Inc(i);
      end;
      Inc(i);
    end;

    FRNotaExplicativaAux.QRPrimario.Preview;

    FRNotaExplicativaAux.Free;
    FRNotaExplicativaAux := Nil;

  end;
end;

end.
