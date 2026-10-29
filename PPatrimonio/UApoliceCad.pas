unit UApoliceCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, Grids, DBGrids, StdCtrls, ImgList, Db, Menus,
  ComCtrls, Mask, Buttons, ExtCtrls, DBDirceu;

type
  TFApoliceCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    SBPatrimonio: TSpeedButton;
    DBMemo1: TDBMemo;
    GBRisco: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DSApoliceRisco: TDataSource;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    RelaodeAplices1: TMenuItem;
    AplicesporVencimento1: TMenuItem;
    DBDirceu1: TDBDirceu;
    procedure SBPatrimonioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RelaodeAplices1Click(Sender: TObject);
    procedure AplicesporVencimento1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FApoliceCad: TFApoliceCad;

implementation

uses UApolice_cl, UPatrimonioCons, UPatrimonio_cl, UApoliceCons,
  URRelacaoApolice, UPatrimonioParam, URApoliceVencimento,
  URPatrimonioItens;

{$R *.DFM}

procedure TFApoliceCad.SBPatrimonioClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = nil Then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk Then
  Begin
    DMApolice.QApoliceCOD_PATRIMONIO_CAB.Value := DMPatrimonio.QPatrimonioConsCOD_PATRIMONIO_CAB.Value;
  End;
end;

procedure TFApoliceCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMApolice.QApolice.Close;
  DMApolice.QApoliceRisco.Close;

  DMApolice.QApolice.Open;
  DMApolice.QApoliceRisco.Open;
end;

procedure TFApoliceCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  //gambi para corrigir um bug que ocorre (nao mostra o botao de incluir [+] abilitado)
  if not DMApolice.QApoliceRisco.Eof then
  begin
    DMApolice.QApoliceRisco.Edit;
    DMApolice.QApoliceRisco.Cancel;
  end;
end;

procedure TFApoliceCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  GBRisco.Enabled := (not (DMApolice.QApolice.State in [dsInsert, dsEdit])) and (not DMApolice.QApolice.Eof);
  SBPatrimonio.Enabled := DMApolice.QApolice.State in [dsInsert, dsEdit];
end;

procedure TFApoliceCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FApoliceCons = nil Then
    FApoliceCons := TFApoliceCons.Create(Application);
  If FApoliceCons.ShowModal = mrOk Then
  Begin
    DMApolice.QApolice.Close;
    DMApolice.QApolice.SetVariable(':PK', DMApolice.QApoliceConsCOD_APOLICE.Value );
    DMApolice.QApolice.Open;
  End;
end;

procedure TFApoliceCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMApolice.QApolice.Close;
  DMApolice.QApoliceCons.Close;
  DMApolice.QApoliceRisco.Close;
  DMPatrimonio.QPatrimonioCons.Close;
  Action := CaFree;
  FApoliceCad := nil;
end;

procedure TFApoliceCad.RelaodeAplices1Click(Sender: TObject);
begin
  inherited;
  If(FRRelacaoApolice = nil)Then
    FRRelacaoApolice := TFRRelacaoApolice.create(Application);
  DMApolice.QRApolice.Close;
  DMApolice.QRApolice.open;
  FRRelacaoApolice.QRPrimario.Preview;
  DMApolice.QRApolice.Close;
end;

procedure TFApoliceCad.AplicesporVencimento1Click(Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam:= TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME1DtInicio.Text := DateToStr(Date);
    FPatrimonioParam.ME1DtFim.Text := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[1].TabVisible:=True;
  If FPatrimonioParam.ShowModal =  mrOk then
  begin
    With DMApolice do
    Begin
      QRApoliceVencimento.close;
      If(Trim(FPatrimonioParam.ME1DtInicio.Text) = '')OR(Trim(FPatrimonioParam.ME1DtFim.Text) = '')Then
        raise Exception.Create('É necessário Informar um período');

      QRApoliceVencimento.SetVariable('DT_INICIO',FPatrimonioParam.ME1DtInicio.Text);
      QRApoliceVencimento.SetVariable('DT_FIM',FPatrimonioParam.ME1DtFim.Text);

      QRApoliceVencimento.open;

      If(FRApoliceVencimento = nil)Then
        FRApoliceVencimento := TFRApoliceVencimento.Create(Application);
      FRApoliceVencimento.QRLPeriodo.Caption := 'Período: ' + FPatrimonioParam.ME1DtInicio.Text + ' até ' + FPatrimonioParam.ME1DtFim.Text;
      If FPatrimonioParam.RGPreview.ItemIndex = 0 then
         FRApoliceVencimento.QRPrimario.Preview
      else
        FRApoliceVencimento.QRPrimario.Print;
      QRApoliceVencimento.Close;
    End;

  end;
end;

procedure TFApoliceCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

end.
