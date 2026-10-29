unit UIndiceDesempenhoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFIndiceDesempenhoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BTPlanoConta2: TBitBtn;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BTPlanoConta1: TBitBtn;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBNavigator2: TDBNavigator;
    Panel3: TPanel;
    RelatriondiceDesempenho1: TMenuItem;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    RelDesempenhoEmpresarial1: TMenuItem;
    RelAnliseVertical1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BTPlanoConta1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTPlanoConta2Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriondiceDesempenho1Click(Sender: TObject);
    procedure RelDesempenhoEmpresarial1Click(Sender: TObject);
    procedure RelAnliseVertical1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIndiceDesempenhoCad: TFIndiceDesempenhoCad;

implementation

uses UIndiceDesempenho_cl, UPlanoContaCons, UPlanoConta_cl,
  UIndiceDesempenhoCons, UContabilParam, URIndiceDesempenho,
  URAvaliacaoDesempenho, URAnaliseVertical;

{$R *.DFM}

procedure TFIndiceDesempenhoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMIndiceDesempenho do
  begin
    QIndiceDesempenho.Open;
    QIndiceDivisor.Open;
    QIndiceDividendo.Open;
  end;

end;

procedure TFIndiceDesempenhoCad.BTPlanoConta1Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.showmodal = mrOk then
   DMIndiceDesempenho.QIndiceDividendoCod_Plano_Conta.Value:=DMPlanoConta.QPlanoContaConsCod_Plano_Conta.Value;
end;

procedure TFIndiceDesempenhoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMIndiceDesempenho do
  begin
    QIndiceDesempenho.Close;
    QIndiceDesempenhoCons.Close;
  end;
  Action := CaFree;
  FIndiceDesempenhoCad:=nil;
end;

procedure TFIndiceDesempenhoCad.BTPlanoConta2Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.showmodal = mrOk then
   DMIndiceDesempenho.QIndiceDivisorCod_Plano_Conta.Value:=DMPlanoConta.QPlanoContaConsCod_Plano_Conta.Value;
end;

procedure TFIndiceDesempenhoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FIndiceDesempenhoCons=Nil then
    FIndiceDesempenhoCons:=TFIndiceDesempenhoCons.Create(Application);
  if FIndiceDesempenhoCons.ShowModal = mrOk then
  begin
    with DMIndiceDesempenho do
    begin
      QIndiceDesempenho.Close;
      QIndiceDesempenho.setVariable('PK',QIndiceDesempenhoConsCOD_INDICE_DESEMPENHO.Value);
      QIndiceDesempenho.Open;
    end;
  end;
end;

procedure TFIndiceDesempenhoCad.RelatriondiceDesempenho1Click(
  Sender: TObject);
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[5].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
  begin
    with DMIndiceDesempenho do
    begin
      QRIndiceDesempenho.Close;
      QRIndiceDesempenho.setVariable('DT_SALDO',FContabilParam.CB5Ano.Text+FContabilParam.CB5Mes.Text);
      if FContabilParam.ME5CodFilial.Text <> '' then
        QRIndiceDesempenho.setVariable('COD_FILIAL',FContabilParam.ME5CodFilial.Text)
      else
        QRIndiceDesempenho.setVariable('COD_FILIAL',null);
      QRIndiceDesempenho.Open;
    end;
    if FRIndiceDesempenho = nil then
      FRIndiceDesempenho.Create(Application);
      FRIndiceDesempenho.QRLAno.Caption:=FContabilParam.CB5Ano.Text;
      FRIndiceDesempenho.QRLMes.Caption:=FContabilParam.CB5Mes.Text;
      FRIndiceDesempenho.QRPrimario.Preview;

  end;
end;

procedure TFIndiceDesempenhoCad.RelDesempenhoEmpresarial1Click(
  Sender: TObject);
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[6].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
  begin
    with DMIndiceDesempenho do
    begin
      QRAvaliacaoDesempenho.Close;
      if Trim(FContabilParam.ME6CodFilial.Text) <> '' then
        QRAvaliacaoDesempenho.setVariable('COD_FILIAL',Trim(FContabilParam.ME6CodFilial.Text))
      else
        QRAvaliacaoDesempenho.setVariable('COD_FILIAL',null);
        QRAvaliacaoDesempenho.setVariable('DT_ANO_MES_1',FContabilParam.CB6Ano_1.Text+FContabilParam.CB6Mes_1.Text);
        QRAvaliacaoDesempenho.setVariable('DT_ANO_MES_2',FContabilParam.CB6Ano_2.Text+FContabilParam.CB6Mes_2.Text);
        QRAvaliacaoDesempenho.setVariable('DT_ANO_MES_3',FContabilParam.CB6Ano_3.Text+FContabilParam.CB6Mes_3.Text);
        QRAvaliacaoDesempenho.setVariable('DT_ANO_MES_4',FContabilParam.CB6Ano_4.Text+FContabilParam.CB6Mes_4.Text);
        QRAvaliacaoDesempenho.setVariable('DT_ANO_MES_5',FContabilParam.CB6Ano_5.Text+FContabilParam.CB6Mes_5.Text);
        QRAvaliacaoDesempenho.setVariable('DT_ANO_MES_6',FContabilParam.CB6Ano_6.Text+FContabilParam.CB6Mes_6.Text);
        QRAvaliacaoDesempenho.setVariable('NUM_GRAU',Trim(FContabilParam.ME6Grau.Text));
        QRAvaliacaoDesempenho.Open;
    end;
    if FRAvaliacaoDesempenho = nil then
      FRAvaliacaoDesempenho.Create(Application);
    FRAvaliacaoDesempenho.QRLPeriodo_1.Caption:=FContabilParam.CB6Ano_1.Text+' - '+FContabilParam.CB6Mes_1.Text;
    FRAvaliacaoDesempenho.QRLPeriodo_2.Caption:=FContabilParam.CB6Ano_2.Text+' - '+FContabilParam.CB6Mes_2.Text;
    FRAvaliacaoDesempenho.QRLPeriodo_3.Caption:=FContabilParam.CB6Ano_3.Text+' - '+FContabilParam.CB6Mes_3.Text;
    FRAvaliacaoDesempenho.QRLPeriodo_4.Caption:=FContabilParam.CB6Ano_4.Text+' - '+FContabilParam.CB6Mes_4.Text;
    FRAvaliacaoDesempenho.QRLPeriodo_5.Caption:=FContabilParam.CB6Ano_5.Text+' - '+FContabilParam.CB6Mes_5.Text;
    FRAvaliacaoDesempenho.QRLPeriodo_6.Caption:=FContabilParam.CB6Ano_6.Text+' - '+FContabilParam.CB6Mes_6.Text;
    FRAvaliacaoDesempenho.QRPrimario.Preview;
 end;
end;
procedure TFIndiceDesempenhoCad.RelAnliseVertical1Click(Sender: TObject);
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[6].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
  begin
    with DMIndiceDesempenho do
    begin
      QRAnaliseVertical.Close;
      if Trim(FContabilParam.ME6CodFilial.Text) <> '' then
        QRAnaliseVertical.setVariable('COD_FILIAL',Trim(FContabilParam.ME6CodFilial.Text))
      else
        QRAnaliseVertical.setVariable('COD_FILIAL',null);
      QRAnaliseVertical.setVariable('DT_ANO_MES_1',FContabilParam.CB6Ano_1.Text+FContabilParam.CB6Mes_1.Text);
      QRAnaliseVertical.setVariable('DT_ANO_MES_2',FContabilParam.CB6Ano_2.Text+FContabilParam.CB6Mes_2.Text);
      QRAnaliseVertical.setVariable('DT_ANO_MES_3',FContabilParam.CB6Ano_3.Text+FContabilParam.CB6Mes_3.Text);
      QRAnaliseVertical.setVariable('DT_ANO_MES_4',FContabilParam.CB6Ano_4.Text+FContabilParam.CB6Mes_4.Text);
      QRAnaliseVertical.setVariable('DT_ANO_MES_5',FContabilParam.CB6Ano_5.Text+FContabilParam.CB6Mes_5.Text);
      QRAnaliseVertical.setVariable('DT_ANO_MES_6',FContabilParam.CB6Ano_6.Text+FContabilParam.CB6Mes_6.Text);    
      QRAnaliseVertical.setVariable('NUM_GRAU',Trim(FContabilParam.ME6Grau.Text));
      QRAnaliseVertical.Open;
    end;
    if FRAnaliseVertical = nil then
      FRAnaliseVertical.Create(Application);
    FRAnaliseVertical.QRLPeriodo_1.Caption:=FContabilParam.CB6Ano_1.Text+' - '+FContabilParam.CB6Mes_1.Text;
    FRAnaliseVertical.QRLPeriodo_2.Caption:=FContabilParam.CB6Ano_2.Text+' - '+FContabilParam.CB6Mes_2.Text;
    FRAnaliseVertical.QRLPeriodo_3.Caption:=FContabilParam.CB6Ano_3.Text+' - '+FContabilParam.CB6Mes_3.Text;
    FRAnaliseVertical.QRLPeriodo_4.Caption:=FContabilParam.CB6Ano_4.Text+' - '+FContabilParam.CB6Mes_4.Text;
    FRAnaliseVertical.QRLPeriodo_5.Caption:=FContabilParam.CB6Ano_5.Text+' - '+FContabilParam.CB6Mes_5.Text;
    FRAnaliseVertical.QRLPeriodo_6.Caption:=FContabilParam.CB6Ano_6.Text+' - '+FContabilParam.CB6Mes_6.Text;
    FRAnaliseVertical.QRPrimario.Preview;
 end;
end;

end.
