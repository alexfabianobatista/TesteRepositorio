unit UProdutoTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFProdutoTransf = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    MeProdutoDe: TMaskEdit;
    MeProdutoPara: TMaskEdit;
    EdProdutoDe: TEdit;
    EdProdutoPara: TEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure MeProdutoDeChange(Sender: TObject);
    procedure MeProdutoParaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoTransf: TFProdutoTransf;

implementation

uses UProdutoCons, UOracle_cl, UProduto_cl;

{$R *.dfm}

procedure TFProdutoTransf.SpeedButton1Click(Sender: TObject);
begin
  If FProdutoCons = Nil Then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = MrOk Then
     MeProdutoDe.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoTransf.SpeedButton2Click(Sender: TObject);
begin
  If FProdutoCons = Nil Then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = MrOk Then
     MeProdutoPara.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFProdutoTransf.BtOkClick(Sender: TObject);
var qtEstoque: String;
begin
  Try
    With DMOracle Do
    Begin
      qtEstoque := '0'+FastSelect('SUM(QT_QUANTIDADE)','TB_ESTOQUE',
        'COD_PRODUTO = ' + Trim(MeProdutoDe.Text));

      DMOracle.DBCemapa.StartTransaction;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estoque_Mov set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Nota_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Pedido_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Ordem_Compra_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Area_Cultivar set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Atestado_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Balanca set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Boletim_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Cadastro_Preco set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Campo_Plantio_Cab set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Certificado_Semente_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Arroz set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Arroz_Saldo set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Cpr set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Gp set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update Tb_Contrato_Cooperacao set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_PJuridica set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Premio set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;


      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Vend set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Custo_Veiculo_Mov set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Controle_Estoque set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Desconto_Agricola set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Desconto_Produtor set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Despesa_Recup set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Emprestimo_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Equipamento_Peca_Cab set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Equipamento_Peca_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estimativa_Meta set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estimativa_Produto set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estoque_Baixar set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estoque_Embarcado set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estoque_Producao set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update Tb_FluxoProduto set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Formula set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Formula_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Guia_Aplicacao set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Imagem_Produto set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Lote_Semente set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Lote_Tipo set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Materia_Prima set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Nota_Aux set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Nota_Classificacao set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update Tb_Nota_Item_Log set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Nota_Transferencia set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Obra_Req_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Nota_Transferencia set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Oficina_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Oficina_Orcamento_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Ordem_Carregamento_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Ordem_Producao_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Ordem_Servico_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Os_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Padrao_Desconto_Produto set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Patrimonio_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Pauta_Icms set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update TB_Pedido_Item_Troca set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Penhor_Cedular set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Pesagem_Producao set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Praga_Produto set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Preco_Agricola set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update TB_PrecoAgricolaTransferencia set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;
      
      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Preco_Lote set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Preco_Pocket set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Producao set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Agricola set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Agricola_Filial set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Bloqueado set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Fornecedor set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update TB_Produto_Indice set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Marca set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Relacionado set cod_Produto_pai = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto_pai = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Relacionado set cod_Produto_Filho = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto_Filho = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Produto_Subst_Trib set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Registro_Tipo60_Resumo set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Requisicao_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Requisicao_Peca_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Romaneio_Agricola set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Romaneio_Fitas set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update TB_Safra set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
        QExecSql.ExecSql;
      Except;
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Servico_Terceiro_Item set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_Nota_Transferencia set cod_Produto = ' + Trim(MeProdutoPara.Text) + ' Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Delete From Tb_Estoque_Inventario Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Delete From Tb_Estoque Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      //---Alterações para o Bloco K - SPED Fiscal---

      QExecSql.Close;
      QExecSql.Sql.Clear;
      //Produto transferido para outro, deve ir para o SPED
      //QExecSql.Sql.Add('Delete From Tb_Produto Where Cod_Produto = '+Trim(MeProdutoDe.Text));
      QExecSql.Sql.Add('Update Tb_Produto set ind_situacao = '+
        QuotedStr('DESATIVADO') + ' where cod_produto = ' + Trim(MeProdutoDe.Text));
      QExecSql.ExecSql;

      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('INSERT INTO TB_PRODUTO_TRANSFERIDO VALUES(');
      QExecSQL.SQL.Add('SQPRODUTO_TRANSFERIDO.NEXTVAL, ');
      QExecSQL.SQL.Add(QuotedStr(DateToStr(DMOracle.DataServ))+', ');
      QExecSQL.SQL.Add(Trim(MeProdutoDe.Text)+', ');
      QExecSQL.SQL.Add(Trim(MeProdutoPara.Text)+', ');
      QExecSQL.SQL.Add(qtEstoque+')');
      QExecSQL.ExecSql;
      //---------------------------------------------

      If DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    End;
  Except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na transição dos produtos.' + #13 + #10 +
        E.Message, mtError, [mbOK], 0);
    end;
  End;

end;

procedure TFProdutoTransf.MeProdutoDeChange(Sender: TObject);
begin
  If Trim(MeProdutoDe.Text) <> '' Then
    EdProdutoDe.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProdutoDe.Text));

end;

procedure TFProdutoTransf.MeProdutoParaChange(Sender: TObject);
begin
  If Trim(MeProdutoPara.Text) <> '' Then
    EdProdutoPara.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProdutoPara.Text));

end;

end.
