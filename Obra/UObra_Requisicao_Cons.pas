unit UObra_Requisicao_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

type
  TFObra_Requisicao_Cons = class(TFTConsulta)
    BtFilial: TSpeedButton;
    Label2: TLabel;
    MeCadastro: TMaskEdit;
    BtCadastro: TSpeedButton;
    Label3: TLabel;
    MeObra: TMaskEdit;
    BtObra: TSpeedButton;
    Label4: TLabel;
    MeRequisicao: TMaskEdit;
    Label5: TLabel;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    Label6: TLabel;
    RgTipoRequisicao: TRadioGroup;
    Label7: TLabel;
    SbProduto: TSpeedButton;
    MeProduto: TMaskEdit;
    procedure BtFilialClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure BtObraClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObra_Requisicao_Cons: TFObra_Requisicao_Cons;

implementation

uses UObra_cl, UFilialCons, UCadastroCons, UObraCons, UFilial_cl,
  UCadastro_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFObra_Requisicao_Cons.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = MrOk Then
    MeTexto.Text:=DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFObra_Requisicao_Cons.BtCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk Then
     MeCadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFObra_Requisicao_Cons.BtObraClick(Sender: TObject);
begin
  inherited;
  If FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  If FObraCons.ShowModal=mrOk Then
     MeObra.Text:=DMObra.QObra_ConsCod_Obra.text;

end;

procedure TFObra_Requisicao_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DmObra Do
  Begin
    QObra_Req_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QObra_Req_Cons.SetVariable('Cod_Filial',Trim(MeTexto.Text))
    Else
       QObra_Req_Cons.SetVariable('Cod_Filial',Null);
    If Trim(MeCadastro.Text) <> '' Then
       QObra_Req_Cons.SetVariable('Cod_Cadastro',Trim(MeCadastro.Text))
    Else
       QObra_Req_Cons.SetVariable('Cod_Cadastro',Null);
    If Trim(MeObra.Text) <> '' Then
       QObra_Req_Cons.SetVariable('Cod_Obra',Trim(MeObra.Text))
    Else
       QObra_Req_Cons.SetVariable('Cod_Obra',Null);
    If Trim(MeProduto.Text) <> '' Then
       QObra_Req_Cons.SetVariable('Cod_Produto',Trim(MeProduto.Text))
    Else
       QObra_Req_Cons.SetVariable('Cod_Produto',Null);
    If Trim(MeRequisicao.Text) <> '' Then
       QObra_Req_Cons.SetVariable('Num_Requisicao',Trim(MeRequisicao.Text))
    Else
       QObra_Req_Cons.SetVariable('Num_Requisicao',Null);
    If Trim(MeDtInicial.Text) <> '' Then
      QObra_Req_Cons.SetVariable('Dt_Emissao_Inic',StrToDate(Trim(MeDtInicial.Text)))
    Else
      QObra_Req_Cons.SetVariable('Dt_Emissao_Inic',Null);
    If Trim(MeDtFinal.Text) <> '' Then
      QObra_Req_Cons.SetVariable('Dt_Emissao_Fim',StrToDate(Trim(MeDtFinal.Text)))
    Else
      QObra_Req_Cons.SetVariable('Dt_Emissao_Fim',Null);
    Case RgTipoRequisicao.ItemIndex of
      0 : QObra_Req_Cons.SetVariable('Ind_Tipo_Requisicao','PROVISORIA');
      1 : QObra_Req_Cons.SetVariable('Ind_Tipo_Requisicao','NOTA');
      2 : QObra_Req_Cons.SetVariable('Ind_Tipo_Requisicao',Null);
    End;  
    QObra_Req_Cons.Open;
  End;
end;

procedure TFObra_Requisicao_Cons.FormActivate(Sender: TObject);
begin
  inherited;
//  MeDtInicial.Text := DateToStr(Date);
//  MeDtFinal.Text := DateToStr(Date);
end;

procedure TFObra_Requisicao_Cons.SbProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = MrOk Then
     MeProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;

end;

procedure TFObra_Requisicao_Cons.FormCreate(Sender: TObject);
begin
  inherited;
  MeDtInicial.Text := DateToStr(Date-30);
  MeDtFinal.Text := DateToStr(Date);
end;

end.
