unit ULancaHorimetro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, Buttons, DBCtrls, UBiblioteca;

type
  TFLancaHorimetro = class(TForm)
    BtAvancar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    SBVeiculo: TSpeedButton;
    MEDescVeiculo: TMaskEdit;
    MEPlaca: TMaskEdit;
    MEKm: TMaskEdit;
    MEDescProduto: TMaskEdit;
    Label5: TLabel;
    MEHoraAtual: TMaskEdit;
    DBEVeiculo: TDBEdit;
    DSLancaHorimetro: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEProduto: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    procedure SBVeiculoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure DBEVeiculoExit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  
  end;

var
  FLancaHorimetro: TFLancaHorimetro;


implementation

uses UVeiculoCons, UVeiculo_cl, UDespesaRecup_cl, UOracle_cl,
  UNotaSaida_cl, UUsuario_cl;

{$R *.dfm}

procedure TFLancaHorimetro.SBVeiculoClick(Sender: TObject);
begin
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    DBEVeiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
    MEKm.Text := DMVeiculo.QVeiculoConsKM_ATUAL.Text;
    MeDescVeiculo.Text := DMVeiculo.QVeiculoConsNUM_CHASSI.Text;
    MEPlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Text;
    MEHoraAtual.Text := DMVeiculo.QVeiculoConsHR_ATUAL.Text;
  end;
end;

procedure TFLancaHorimetro.FormActivate(Sender: TObject);
var
wCodReceita, wCodConsumo : string;
begin
  if DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C' then
  Begin
    DBEdit1.ReadOnly := true;
    DBEdit2.ReadOnly := true;
    DBEdit3.ReadOnly := True;
    DBEdit4.ReadOnly := True;
    DBEdit1.Color := clBtnFace;
    DBEdit2.Color := clBtnFace;
    DBEdit3.Color := clWindow;
    DBEdit1.Visible := False;
    DBEdit2.Visible := False;
    DBEdit3.Visible := False;
    DBEdit4.Visible := False;
    MEHoraAtual.Visible := False;
    Label3.Visible := False;
    Label4.Visible := False;
    Label5.Visible := False;
    Label7.Visible := False;
    Label8.Visible := False;
    wCodConsumo := '';
    wCodConsumo := DMOracle.BuscaNome('SELECT COD_CUSTO_VEICULO_MOV FROM TB_CUSTO_VEICULO_MOV','COD_NOTA_ITEM = '+
                           DMNotaSaida.QItemNFCOD_NOTA_ITEM.Text);


    if wCodConsumo <> '' Then
    Begin
      DMDespesaRecup.QLancaConsumo.Close;
      DMDespesaRecup.QLancaConsumo.SetVariable('PK',wCodConsumo);
      DMDespesaRecup.QLancaConsumo.Open;
      MeDescProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+
                            DMNotasaida.QItemNFCOD_PRODUTO.Text );
      DBEVeiculoExit(self);
    end
    else
    Begin
      DMDespesaRecup.QLancaConsumo.Open;
      DMDespesaRecup.QLancaConsumo.Insert;
      DMDespesaRecup.QLancaConsumoCOD_PRODUTO.Value := DMNotasaida.QItemNFCOD_PRODUTO.Value;
      MeDescProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+
                            DMNotasaida.QItemNFCOD_PRODUTO.Text );
      DMNotaSaida.QItemNF.Post;
      DMNotaSaida.QItemNF.Edit;
    end;
  end
  else
  Begin
    DBEdit1.ReadOnly := False;
    DBEdit2.ReadOnly := False;
    DBEdit3.ReadOnly := True;
    DBEdit1.Color := clBtnFace;
    DBEdit2.Color := clBtnFace;
    DBEdit3.Color := clWindow;

    wCodReceita := '';
    wCodReceita := DMOracle.BuscaNome('SELECT COD_DESPESA_RECUP FROM TB_DESPESA_RECUP','COD_NOTA_ITEM = '+
                         DMNotaSaida.QItemNFCOD_NOTA_ITEM.Text);

    if wCodReceita <> '' Then
    Begin
      DMDespesaRecup.QLancaHorimetro.Close;
      DMDespesaRecup.QLancaHorimetro.SetVariable('PK',wCodReceita);
      DMDespesaRecup.QLancaHorimetro.Open;
      MeDescProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+
                            DMNotasaida.QItemNFCOD_PRODUTO.Text );
      DBEVeiculoExit(self);
    end
    else
    Begin
      DMDespesaRecup.QLancaHorimetro.Open;
      DMDespesaRecup.QLancaHorimetro.Insert;
      DMDespesaRecup.QLancaHorimetroCOD_PRODUTO.Value := DMNotasaida.QItemNFCOD_PRODUTO.Value;
      MeDescProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+
                            DMNotasaida.QItemNFCOD_PRODUTO.Text );
    end;
  end;
end;

procedure TFLancaHorimetro.BtAvancarClick(Sender: TObject);
begin
  with DMDespesaRecup do
  begin
    if DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C' then
    Begin
      //operacao com ind_fixar_empresa é consumo: e lança no veículo com o custo do estoque e como despesa, diferente das outras operaçoes
      //que no vendas geram uma receita para o veículo

      QLancaConsumoCOD_NOTA_ITEM.Value := DMNotaSaida.QItemNFCOD_NOTA_ITEM.Value;
      QLancaConsumoVL_CUSTO.Value := DMNotaSaida.QItemNFVAL_UNITARIO.Value;
      if QLancaConsumoVL_CUSTO.Value = 0 then
        Raise Exception.Create('Produto sem custo cadastrado! Cadastre o Custo primeiro!');

      //DMNotaSaida.QItemNF.Edit;
      QLancaConsumoQT_QUANTIDADE.Value := DMNotaSaida.QItemNFQT_QUANTIDADE.Value;
      QLancaConsumoVL_CUSTO.Value := DMNotaSaida.QItemNFVAL_UNITARIO.Value * DMNotaSaida.QItemNFQT_QUANTIDADE.Value; 
      QLancaConsumoDT_LCTO.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
      QLancaConsumoDT_MOVIMENTO.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
      QLancaConsumoCOD_CADASTRO.Value := DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value;
      QLancaConsumoCOD_VEICULO.Value := StrToInt(DBEVeiculo.Text);
      QLancaConsumoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QLancaConsumoCOD_LOTE_TIPO.Value := 1;
      QLancaConsumo.Post;
      FLancaHorimetro.Close;
    end
    else
    Begin
      QLancaHorimetroCOD_NOTA_ITEM.Value := DMNotaSaida.QItemNFCOD_NOTA_ITEM.Value;

      //operacao com ind_fixar_empresa é consumo: e lança no veículo com o custo do estoque e como despesa, diferente das outras operaçoes
      //que no vendas geram uma receita para o veículo
      if DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C' then
        QLancaHorimetroVL_UNITARIO.Value := StrToFloat(DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO='+DMNotaSaida.QitemNFCOD_Produto.Text))
      Else
      Begin
        if QLancaHorimetroVL_UNITARIO.Value = 0 then  //Adicionado campo valor unitário. -Kauã 28/07/2021
          QLancaHorimetroVL_UNITARIO.Value := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO='+DMNotaSaida.QitemNFCOD_Produto.Text))
        else
          QLancaHorimetroVL_UNITARIO.Value := StrToFloat(DBEdit4.Text);
      end;
      DMNotaSaida.QItemNF.Edit;
      DMNotaSaida.QItemNFQT_QUANTIDADE.Value := DMDespesaRecup.QLancaHorimetroQT_QUANTIDADE.Value;
      DMNotaSaida.QItemNFVAL_UNITARIO.Value := DMDespesaRecup.QLancaHorimetroVL_UNITARIO.Value;
      QLancaHorimetroDT_DESPESA.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
      QLancaHorimetroDT_INICIO.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
      QLancaHorimetroCOD_CADASTRO.Value := DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value;
      QLancaHorimetroCOD_VEICULO.Value := StrToInt(DBEVeiculo.Text);
      QLancaHorimetro.Post;
      FLancaHorimetro.Close;
      DMNotaSaida.QItemNFDESC_INF_ADICIONAL.Text := MEDescVeiculo.Text + '  Hora Inicial:' +
                                      QLancaHorimetroNUM_HORA_INICIO.Text + '  Hora FInal:'+QLancaHorimetroNUM_HORA_FIM.Text;

      If StrToFLoat(MEHoraAtual.Text) < QLancaHorimetroNUM_HORA_FIM.Value then
      Begin
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_VEICULO SET HR_ATUAL = ' + chr(39) + QLancaHorimetroNUM_HORA_FIM.Text + chr(39));
        DMOracle.QExecSQL.SQL.Add('WHERE COD_VEICULO = ' + chr(39) + QLancaHorimetroCOD_VEICULO.Text + chr(39));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      end;
    end;
  end;
end;

procedure TFLancaHorimetro.DBEVeiculoExit(Sender: TObject);
begin
  If Trim(DBEVeiculo.Text) <> '' then
  Begin
    DMVeiculo.QVeiculoCons.Close;
    DMVeiculo.QVeiculoCons.SetVariable('COD_VEICULO',Trim(DBEVeiculo.Text));
    DMVeiculo.QVeiculoCons.Open;
    DBEVeiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
    MEKm.Text := DMVeiculo.QVeiculoConsKM_ATUAL.Text;
    MeDescVeiculo.Text := DMVeiculo.QVeiculoConsNUM_CHASSI.Text;
    MEPlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Text;
    MEHoraAtual.Text := DMVeiculo.QVeiculoConsHR_ATUAL.Text;
  end;
end;

procedure TFLancaHorimetro.DBEdit2Exit(Sender: TObject);
begin
  if DMDespesaRecup.QLancaHorimetroNUM_HORA_FIM.Value < DMDespesaRecup.QLancaHorimetroNUM_HORA_INICIO.Value then
  Begin
    DBEdit1.SetFocus;
    ShowMessage('Hora Final menor que inicial!');
  end;
  if DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C' then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFQT_QUANTIDADE.Value := DMDespesaRecup.QLancaConsumoQT_QUANTIDADE.Value;
  end
  else
  Begin
    DMDespesaRecup.QLancaHorimetroQT_QUANTIDADE.Value := DMDespesaRecup.QLancaHorimetroNUM_HORA_FIM.Value -
                                                       DMDespesaRecup.QLancaHorimetroNUM_HORA_INICIO.Value;
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFQT_QUANTIDADE.Value := DMDespesaRecup.QLancaHorimetroQT_QUANTIDADE.Value;
  end;


end;

end.
