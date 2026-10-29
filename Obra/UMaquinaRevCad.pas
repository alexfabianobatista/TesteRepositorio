unit UMaquinaRevCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFMaquinaRevCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SBObra: TSpeedButton;
    SBCadastro: TSpeedButton;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBNavigator1: TDBNavigator;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    RelaodeRevisodeMquinas1: TMenuItem;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    RelaodasPrximasRevises1: TMenuItem;
    procedure SBObraClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeRevisodeMquinas1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure RelaodasPrximasRevises1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMaquinaRevCad: TFMaquinaRevCad;

implementation

uses UMaquinaRev_cl, UObraCons, UCadastroCons, UObra_cl, UCadastro_cl,
  UMaquinaRevCons, UObra_Param, URMaquinaRev, URMaquinaProxRev;

{$R *.DFM}

procedure TFMaquinaRevCad.SBObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = nil then
    FObraCons := TFObraCons.Create(Application);
  if FObraCons.showModal = mrOk then
     DMMaquinaRev.QMaquinaRevCabCOD_OBRA.value := DMObra.QObra_consCOD_OBRA.value;
end;

procedure TFMaquinaRevCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
     DMMaquinaRev.QMaquinaRevCabCOD_CADASTRO.value := DMCadastro.QCadastroConsCOD_CADASTRO.value;

end;

procedure TFMaquinaRevCad.FormActivate(Sender: TObject);
begin
  inherited;
    DSPrimario.DataSet.Open;
end;

procedure TFMaquinaRevCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DSPrimario.DataSet.Close;
end;

procedure TFMaquinaRevCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMaquinaRevCons = nil then
    FMaquinaRevCons := TFMaquinaRevCons.Create(Application);
  if FMaquinaRevCons.showModal = mrOk then
  begin
    DSPrimario.DataSet.Close;
    DMMaquinaRev.QMaquinaRevCab.SetVariable('PK',DMMaquinaRev.QMaquinaRevConsCOD_MAQUINA_REV_CAB.Text);
    DSPrimario.DataSet.Open;
  end;

end;

procedure TFMaquinaRevCad.RelaodeRevisodeMquinas1Click(Sender: TObject);
begin
  inherited;
 if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[4].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMMaquinaRev do
  begin
    QRMaquinaRev.Close;
    if Trim(FObra_Param.ME5Filial.Text) = '' then
      QRMaquinaRev.SetVariable('FILIAL',Null)
    else
      QRMaquinaRev.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.ME5Filial.Text)));
    if Trim(FObra_Param.ME5Obra.Text) = '' then
      QRMaquinaRev.SetVariable('OBRA',Null)
    else
      QRMaquinaRev.SetVariable('OBRA',StrToInt(Trim(FObra_Param.ME5Obra.Text)));
    if Trim(FObra_Param.ME5Cadastro.Text) = '' then
      QRMaquinaRev.SetVariable('CADASTRO',Null)
    else
      QRMaquinaRev.SetVariable('CADASTRO',StrToInt(Trim(FObra_Param.ME5Cadastro.Text)));
    if Trim(FObra_Param.Me5DtInicial.Text) <> '' then
      QRMaquinaRev.SetVariable('DT_INICIO',StrToDate(FObra_Param.Me5DtInicial.Text))
    else
      Raise Exception.Create('Período deve ser Informado');
    if Trim(FObra_Param.Me5DtFinal.Text) = '' then
      FObra_Param.ME5DtFinal.Text := DateToStr(Date);
    QRMaquinaRev.SetVariable('DT_FIM',StrToDate(FObra_Param.Me5DtFiNAL.Text));

    QRMaquinaRev.Open;
    if FRMaquinaRev = Nil then
      FRMaquinaRev := TFRMaquinaRev.Create(Application);
    FRMaquinaRev.QRLTitulo.Caption := 'Relação de Revisão de Máquinas De '+FObra_Param.Me5DtInicial.Text + ' Até ' + FObra_Param.Me5DtFinal.Text;
    FRMaquinaRev.QRLFilial.Caption := 'Filial: ' + FObra_Param.Ed5Filial.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRMaquinaRev.QRPrimario.Preview
    else
      FRMaquinaRev.QRPrimario.Print;
    QRMaquinaRev.Close;
  end;
end;

procedure TFMaquinaRevCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit8.SetFocus;
end;

procedure TFMaquinaRevCad.RelaodasPrximasRevises1Click(Sender: TObject);
begin
  inherited;
 if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[5].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMMaquinaRev do
  begin
    QRMaquinaProxRev.Close;
    if Trim(FObra_Param.ME6Filial.Text) = '' then
      QRMaquinaProxRev.SetVariable('FILIAL',Null)
    else
      QRMaquinaProxRev.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.ME6Filial.Text)));
    if Trim(FObra_Param.ME6Obra.Text) = '' then
      QRMaquinaProxRev.SetVariable('OBRA',Null)
    else
      QRMaquinaProxRev.SetVariable('OBRA',StrToInt(Trim(FObra_Param.ME6Obra.Text)));

    QRMaquinaProxRev.Open;
    if FRMaquinaProxRev = Nil then
      FRMaquinaProxRev := TFRMaquinaProxRev.Create(Application);
    FRMaquinaProxRev.QRLFilial.Caption := 'Filial: '+FObra_Param.Ed6Filial.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRMaquinaProxRev.QRPrimario.Preview
    else
      FRMaquinaProxRev.QRPrimario.Print;
    QRMaquinaProxRev.Close;
  end;
end;

end.
