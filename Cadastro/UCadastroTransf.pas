unit UCadastroTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask;

type
  TFCadastroTransf = class(TForm)
    GroupBox1: TGroupBox;
    MeCadastroDe: TMaskEdit;
    MeCadastroPara: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    EdCadastroDe: TEdit;
    EdCadastroPara: TEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure BtCadastroClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MeCadastroDeExit(Sender: TObject);
    procedure MeCadastroParaExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroTransf: TFCadastroTransf;

implementation

uses UCadastroCons, UCadastro_cl, UOracle_cl;

{$R *.DFM}

procedure TFCadastroTransf.BtCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECadastroDe.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroDeExit(Self);
  End;
end;

procedure TFCadastroTransf.SpeedButton2Click(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECadastroPara.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroParaExit(Self);
  End;

end;

procedure TFCadastroTransf.MeCadastroDeExit(Sender: TObject);
begin
  If Trim(MeCadastroDe.Text) <> '' Then
    EdCadastroDe.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MeCadastroDe.Text));
end;

procedure TFCadastroTransf.MeCadastroParaExit(Sender: TObject);
begin
  If Trim(MeCadastroPara.Text) <> '' Then
    EdCadastroPara.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MeCadastroPara.Text));
end;

procedure TFCadastroTransf.BtOkClick(Sender: TObject);
begin
  Try
    With DMOracle Do
    Begin
      DMOracle.DBCemapa.StartTransaction;
      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Nota_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Conta_Receber_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Conta_Pagar_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Caixa_Mov set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Balanca set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Bco_Movimento set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Campo_Plantio_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Conhecimento set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close; //Adicionado para corrigir mensagem de erro da Grasel (Sistema.fk_conhecimentoXcadastro3 violated - child record found) - Alex 12/05/2021
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Conhecimento set COD_CADASTRO_REMETENTE = ' + Trim(MeCadastroPara.Text) + ' Where COD_CADASTRO_REMETENTE = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Conhecimento_Frete set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato set Cod_Fiel_Depositario = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Fiel_Depositario = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Arroz set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Cpr set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Gp set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Mensal set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Vend set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Vend_Custos set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Estadia set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Marcacao_Hora set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Obra set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Obra_Contrato set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Obra_Req_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Orcamento_Oficina set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Ordem_Carregamento_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Ordem_Compra_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Ordem_Servico_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Os set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Pedido_Cab set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      try
        QExecSql.ExecSql;
      except
        Raise Exception.Create('Erro ao atualizar pedidos. Verifique se os dois cadastros não possuem' +
            ' pedidos com a mesma numeração e para a mesma filial.' + #13 + #10 +
            'Se sim, é necessário alterar a numeração de um deles, ou a filial, ou excluir o pedido.');
      end;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Penhor_Cedular set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Produto_Bloqueado set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Produto_Fornecedor set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Produto_Seguranca set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Propriedade set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Rateio_Romaneio set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Romaneio_Agricola set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Rpa set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Veiculo set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Contrato_Vend_Custos set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Consulta_scpc set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Nota_Transferencia set Cod_Cadastro_Origem = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro_Origem = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update Tb_Nota_Transferencia set Cod_Cadastro_Destino = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro_Destino = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update TB_SERVICO_TERCEIRO set COD_CADASTRO = ' + Trim(MeCadastroPara.Text) + ' Where COD_CADASTRO = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Update tb_nota_cab set cod_transportador = ' + Trim(MeCadastroPara.Text) + ' Where cod_transportador = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;

      Try
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Update Tb_Cadastro_Enderecos set cod_Cadastro = ' + Trim(MeCadastroPara.Text) + ' Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
        QExecSql.ExecSql;
      Except
        QExecSql.Close;
        QExecSql.Sql.Clear;
        QExecSql.Sql.Add('Delete From Tb_Cadastro_Enderecos Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
        QExecSql.ExecSql;
      End;
      QExecSql.Close;
      QExecSql.Sql.Clear;
      QExecSql.Sql.Add('Delete From Tb_Cadastro Where Cod_Cadastro = '+Trim(MeCadastroDe.Text));
      QExecSql.ExecSql;
      ShowMessage('Alteração de cadastro realizada com sucesso!');

      If DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    End;
  Except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Erro na transição dos cadastros.' + #13 + #10 +
        E.Message, mtError, [mbOK], 0);
    end;
  End;
end;

end.
