unit URequisicaoPecaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFRequisicaoPecaCad = class(TFTCadSimples)
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
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BTFilial: TBitBtn;
    BTFuncionario: TBitBtn;
    BTProduto: TBitBtn;
    BTOS: TBitBtn;
    DBEdit11: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTFilialClick(Sender: TObject);
    procedure BTFuncionarioClick(Sender: TObject);
    procedure BTProdutoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BTOSClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoPecaCad: TFRequisicaoPecaCad;

implementation

uses  UFilialCons, UFilial_cl, UFFuncionarioCons,
  UFuncionario_cl, UProdutoCons, UProduto_cl, URequisicaoPeca_cl,
  UOSManutencaoCons, UOSManutencao_cl, URequisicaoPecaCons;

{$R *.DFM}

procedure TFRequisicaoPecaCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMRequisicaoPeca do
  begin
    QRequisicaoPeca.open;
    QRequisicaoPecaItem.Open;
  end;
end;

procedure TFRequisicaoPecaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMRequisicaoPeca do
  begin
    QRequisicaoPeca.Close;
    QRequisicaoPecaItem.Close;
  end;
  action := caFree;
  FRequisicaoPecaCad := nil;
end;

procedure TFRequisicaoPecaCad.BTFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.showModal = mrOk then
  begin
    DMRequisicaoPeca.QRequisicaoPecaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
  end;
end;

procedure TFRequisicaoPecaCad.BTFuncionarioClick(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.showModal = mrOk then
  begin
    DMRequisicaoPeca.QRequisicaoPecaCod_Funcionario.Value := DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
  end;
end;

procedure TFRequisicaoPecaCad.BTProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.showModal = mrOk then
  begin
    DMRequisicaoPeca.QRequisicaoPecaItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
  end;
end;

procedure TFRequisicaoPecaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DMRequisicaoPeca.QRequisicaoPeca.State in [DSInsert,DSEdit] then
  begin
    FRequisicaoPecaCad.BTFilial.enabled:=true;
    FRequisicaoPecaCad.BTFuncionario.enabled:=true;
    FRequisicaoPecaCad.BTOS.enabled:=true;
  end
  else
  begin
    FRequisicaoPecaCad.BTFilial.enabled:=false;
    FRequisicaoPecaCad.BTFuncionario.enabled:=false;
    FRequisicaoPecaCad.BTOS.enabled:=false;
  end;
   
end;

procedure TFRequisicaoPecaCad.BTOSClick(Sender: TObject);
begin
  inherited;
  If FOSManutencaoCons = Nil then
    FOSManutencaoCons := TFOSManutencaoCons.Create(Application);
  If FOSManutencaoCons.showModal = mrOk then
  begin
    DMRequisicaoPeca.QRequisicaoPecaNum_OS_Manutencao.Value := DMOSManutencao.QOSManutencaoConsNum_OS_Manutencao.Value;
  end;
end;

procedure TFRequisicaoPecaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FRequisicaoPecaCons = Nil then
    FRequisicaoPecaCons := TFRequisicaoPecaCons.Create(Application);
  if FRequisicaoPecaCons.ShowModal = mrOk then
  With DMRequisicaoPeca do
  Begin
    QRequisicaoPeca.Close;
    QRequisicaoPeca.SetVariable('PK',QRequisicaoPecaConsNum_Requisicao_Peca.Value);
    QRequisicaoPeca.Open;
  End;
end;

end.
