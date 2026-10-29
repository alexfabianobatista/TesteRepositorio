unit UHistContabilCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFHistContabilCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    HistricoContbil1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure HistricoContbil1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistContabilCad: TFHistContabilCad;

implementation

uses UHistContabil_cl, UHistContabilCons, URHistContabil, UPlanoContasParam,
  UHistContabilParam;

{$R *.DFM}

procedure TFHistContabilCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
  With DMHistContabil do
  Begin
    QHistContabil.Close;
    QHistContabil.SetVariable('PK',QHistContabilConsCod_Historico_Contabil.Value);
    QHistContabil.Open;
    QHistContabilCons.Close;
  End;
  FHistContabilCons.Release;
  FHistContabilCons:=Nil;
end;

procedure TFHistContabilCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMHistContabil do
    QHistContabil.Open;
end;

procedure TFHistContabilCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

procedure TFHistContabilCad.HistricoContbil1Click(Sender: TObject);
begin
  inherited;
  if FHistContabilParam = Nil then
    FHistContabilParam:=TFHistContabilParam.Create(Application);
  FHistContabilParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FHistContabilParam.ShowModal = mrOK  then
    begin
      with DMHistContabil do
        begin
          QRHistContabil.Close;
          QRHistContabil.SQL[QRHistContabil.SQL.Count-1]:='';  // elimina a última Linha da SQL
          If FHistContabilParam.Rg0Ordem.ItemIndex = 0 Then
             QRHistContabil.SQL.Add('ORDER BY DESC_HISTORICO_CONTABIL')
          Else
             QRHistContabil.SQL.Add('ORDER BY COD_HISTORICO_CONTABIL');
          QRHistContabil.Open;
          If FRHistContabil= Nil then
             FRHistContabil:=TFRHistContabil.Create(Application);
          FRHistContabil.Pag_Inicial := StrToInt(Trim(FHistContabilParam.ME0Pagina.text))-1;
          FRHistContabil.Pag_Inicial_Param := StrToInt(Trim(FHistContabilParam.ME0Pagina.text))-1;
          If FHistContabilParam.RGPreview.ItemIndex=0 then
            FRHistContabil.QRPrimario.Preview
          else
            FRHistContabil.QRPrimario.Print;
          QRHistContabil.Close;
        End;
    end;
    FRHistContabil.Release;
    FRHistContabil:=Nil;
end;

procedure TFHistContabilCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMHistContabil do
    QHistContabil.Close;
  Action := CaFree;
  FHistContabilCad := Nil;
end;

end.
