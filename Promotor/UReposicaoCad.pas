unit UReposicaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, DBDirceu, variants;

type
  TFReposicaoCad = class(TFTCadSimples)
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
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    BTCadastroCons: TBitBtn;
    BTPromotorCons: TBitBtn;
    RelReposioProdutos1: TMenuItem;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BTCadastroConsClick(Sender: TObject);
    procedure BTPromotorConsClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelReposioProdutos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReposicaoCad: TFReposicaoCad;

implementation

uses UPromoto_cl, UCadastroCons, UCadastro_cl, UPromotorCons, UProdutoCons,
  UProduto_cl, UReposicaoCons, UPromotorParam, URReposicao;

{$R *.DFM}

procedure TFReposicaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPromotor.QReposicao.Close;
  DMPromotor.QReposicao.Open; 
end;

procedure TFReposicaoCad.BTCadastroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMPromotor.QReposicaoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFReposicaoCad.BTPromotorConsClick(Sender: TObject);
begin
  inherited;
  If FPromotorCons = Nil then
    FPromotorCons := TFPromotorCons.Create(Application);
  If FPromotorCons.ShowModal = mrOk then
    DMPromotor.QReposicaoCod_Promotor.Value := DMPromotor.QPromotorConsCod_Promotor.Value;
end;

procedure TFReposicaoCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  BTCadastroCons.Enabled:=DSPrimario.State<>dsBrowse;
  BTPromotorCons.Enabled:=DSPrimario.State<>dsBrowse;
end;

procedure TFReposicaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FReposicaoCons= Nil then
    FReposicaoCons:= TFReposicaoCons.Create(Application);
  If FReposicaoCons.Showmodal = mrOk then
  With DMPromotor do
  Begin
    QReposicao.Close;
    QReposicao.SetVariable('PK', QReposicaoConsCod_Reposicao.Value);
    QReposicao.Open;
  End;
end;

procedure TFReposicaoCad.RelReposioProdutos1Click(Sender: TObject);
begin
  inherited;
  If(FPromotorParam = nil)Then
    FPromotorParam := TFPromotorParam.Create(Application);
  FPromotorParam.PGRelatorio.Pages[1].TabVisible := True;
  if FPromotorParam.ShowModal = mrOk then
  begin
    With DMPromotor do
    Begin
      QRReposicao.Close;

      if trim(FPromotorParam.ME2Cadastro.text) <> '' then
        QRReposicao.SetVariable('COD_CADASTRO',Trim(FPromotorParam.ME2Cadastro.Text))
      else
        QRReposicao.SetVariable('COD_CADASTRO',null);

      if trim(FPromotorParam.ME2Promotor.text) <> '' then
        QRReposicao.SetVariable('COD_PROMOTOR',Trim(FPromotorParam.ME2Promotor.Text))
      else
        QRReposicao.SetVariable('COD_PROMOTOR',null);

      if trim(FPromotorParam.ME2Data_I.Text) <> '' then
        QRReposicao.SetVariable('DATA_I',Trim(FPromotorParam.ME2Data_I.Text))
      else
        QRReposicao.SetVariable('DATA_I',null);

      if trim(FPromotorParam.ME2Data_F.Text) <> '' then
        QRReposicao.SetVariable('DATA_F',Trim(FPromotorParam.ME2Data_F.Text))
      else
        QRReposicao.SetVariable('DATA_F',null);

      QRReposicao.Open;

      If FRReposicao = Nil then
        FRReposicao := TFRReposicao.Create(Application);
      FRReposicao.QRLTitulo.Caption:='Relatório Reposição de Produtos';
      FRReposicao.QRLPeriodo.Caption:='Período '+FPromotorParam.ME2Data_I.Text+' até '+FPromotorParam.ME2Data_F.Text;
      If FPromotorParam.RGPreview.ItemIndex=0 then
        FRReposicao.QRPrimario.Preview
      Else
        FRReposicao.QRPrimario.Print;

      QRReposicao.Close;
    End;
  end;
end;

end.
